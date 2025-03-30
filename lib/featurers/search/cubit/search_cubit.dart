import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:my_shop/core/data/remoat/api_dio.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final ApiDio _apiDio = ApiDio();

  List<ProductModel> products = [];

  Future<void> getProduct() async {
    products = [];
    emit(GetProductSeLoading());
    try {
      final data = await _apiDio.getData(path: "products");

      if (data.statusCode == 200) {
        for (var product in data.data) {
          products.add(ProductModel.fromJson(product));
        }

        emit(GetProductSeSucecc());
      } else {}
      // log(data.toString());
    } catch (e) {
      // log(e.toString());
      emit(GetProductSeErorr());
    }
  }

  List<ProductModel> productsSearch = [];
  void serchByName({required String name}) {
    productsSearch = [];
    for (var element in products) {
      if (element.productTitle!.toLowerCase().contains(name)) {
        productsSearch.add(element);
      }
    }
    emit(GetProductSuceccSe());
  }

  List<ProductModel> productsSearchByMarkaAndCat = [];

  String? selectedCategory;
  String? selectedMarka;
  void selectCategoryHome(String category) {
    selectedCategory = null;
    selectedMarka = null;
    selectedCategory = category;
    filterProducts();
  }

  void selectMarkaExplor(String marka) {
    selectedMarka = null;
    selectedCategory = null;
    selectedMarka = marka;
    filterProducts();
  }

  void selectCategory(String category) {
    selectedCategory = category;
    filterProducts();
  }

  void selectMarka(String marka) {
    selectedMarka = marka;
    filterProducts();
  }

  void filterProducts() {
    if (selectedCategory != null && selectedMarka != null) {
      serchByMarkaAndCat(marka: selectedMarka!, catogry: selectedCategory!);
    } else if (selectedCategory != null) {
      productsSearchByMarkaAndCat = products
          .where((product) => product.catrgory == selectedCategory)
          .toList();
    } else if (selectedMarka != null) {
      productsSearchByMarkaAndCat =
          products.where((product) => product.marka == selectedMarka).toList();
    } else {
      productsSearchByMarkaAndCat = products;
    }
    emit(GetProductSuceccMarkaAndCategory());
  }

  void serchByMarkaAndCat({required String marka, required String catogry}) {
    productsSearchByMarkaAndCat = products.where((product) {
      return product.marka == marka && product.catrgory == catogry;
    }).toList();
    emit(GetProductSuceccMarkaAndCategory());
  }

  void clearFilter() {
    productsSearchByMarkaAndCat = [];
    productsSearch = [];
    selectedCategory = null;
    selectedMarka = null;

    emit(ClearFilter());
  }
}
