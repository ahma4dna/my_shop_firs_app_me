import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:my_shop/core/data/remoat/api_dio.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/model/review_model/review_model.dart';


part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final ApiDio _apiDio = ApiDio();

  List<ProductModel> products = [];

  Future<void> getProduct() async {
    products = [];
    emit(GetProductLoading());
    try {
      final data = await _apiDio.getData(path: "products");

      if (data.statusCode == 200) {
        for (var product in data.data) {
          products.add(ProductModel.fromJson(product));
        }

        emit(GetProductSucecc());
      } else {}
      // log(data.toString());
    } catch (e) {
      // log(e.toString());
      emit(GetProductErorr());
    }
  }

  List<ReviewModel> reviews = [];

  Future<void> getReview({required String productId}) async {
    reviews = [];
    emit(GetReviewLoading());
    try {
      final data = await _apiDio.getData(path: "review?select=*,users(*)&for_product=eq.$productId");

      if (data.statusCode == 200) {
        for (var reviwe in data.data) {
          reviews.add(ReviewModel.fromJson(reviwe));
        }

        emit(GetProductSucecc());
      } else {}
      log(data.toString());
    } catch (e) {
      log(e.toString());
      emit(GetReviewErorr());
    }
  }
}
