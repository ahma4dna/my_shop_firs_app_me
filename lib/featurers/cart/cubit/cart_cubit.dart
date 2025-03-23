import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:my_shop/core/data/remoat/api_dio.dart';
import 'package:my_shop/featurers/cart/model/cart_model/cart_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  ApiDio apiDio = ApiDio();
  List<CartModel> cardPurchases = [];

  Future<void> getCards() async {
    cardPurchases = [];
    emit(GetCardsLoading());
    try {
      final data = await apiDio.getData(
        path:
            "card_and_purchase?select=*,products(*)&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}",
      );
      for (var card in data.data) {
        cardPurchases.add(CartModel.fromJson(card));
      }
      log(data.toString());
      emit(GetCardsSucecc());
    } catch (e) {
      log(e.toString());
      emit(GetCardsErorr());
    }
  }

  Future<void> addCards(
      {required Map<String, dynamic> data, required String prodctId}) async {
    emit(AddCardsLoading());
    try {
      final dataRes = await apiDio.postData(
        path:
            "card_and_purchase?select=*,products(*)&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}",
        data: data,
      );
      //local  add to cart
      cardPurchases.add(CartModel(
        forProduct: prodctId,
      ));

      log(dataRes.toString());
      emit(AddCardsSucecc());
    } catch (e) {
      log(e.toString());
      emit(AddCardsErorr());
    }
  }

  Future<void> removeCards(
      {required Map<String, dynamic> data,
      required String prodctId,
      required String id}) async {
    emit(RemoveCardsLoading());
    try {
      final dataRes = await apiDio.delateData(
        path: "card_and_purchase?select=*,products(*)&id=eq.$id",
        data: data,
      );
      //local  remove to cart

      cardPurchases.removeWhere((element) => element.forProduct == prodctId);

      log(dataRes.toString());
      emit(RemoveCardsSucecc());
    } catch (e) {
      log(e.toString());
      emit(RemoveCardsErorr());
    }
  }

  Future<void> updateQuantity(
      {required Map<String, dynamic> data, required String id}) async {
    emit(UpdateQuantityCardsLoading());
    try {
      final dataRes = await apiDio.putDat(
        path: "card_and_purchase?id=eq.$id",
        data: data,
      );

      log(dataRes.toString());
      emit(UpdateQuantityCardsSucecc());
    } catch (e) {
      log(e.toString());
      emit(UpdateQuantityCardsErorr());
    }
  }

  Future<void> updateToalProctPrice(
      {required Map<String, dynamic> data, required String id}) async {
    emit(UpdateTotalPriceProdctLoading());
    try {
      final dataRes = await apiDio.putDat(
        path: "card_and_purchase?id=eq.$id",
        data: data,
      );

      log(dataRes.toString());
      emit(UpdateTotalPriceProdctSucecc());
    } catch (e) {
      log(e.toString());
      emit(UpdateTotalPriceProdctErorr());
    }
  }

  Future<void> removeAllCards() async {
    emit(RemoveAllCardsLoading());
    try {
      final dataRes = await apiDio.delatAll(
        path:
            "card_and_purchase?for_user=eq.${Supabase.instance.client.auth.currentUser!.id}",
      );
      //local  removeAll to cart
      cardPurchases.clear();

      log(dataRes.toString());
      emit(RemoveAllCardsSucecc());
    } catch (e) {
      log(e.toString());
      emit(RemoveAllCardsErorr());
    }
  }

  bool isInCartqe({required String productId}) {
    return cardPurchases.any((cartItem) => cartItem.forProduct == productId);
  }

  //local quantity
  int totalPrice() {
    int result = 0;
    if (cardPurchases.isNotEmpty) {
      result = 0;

      for (var item in cardPurchases) {
        result += int.parse(item.products!.price!) * item.quantiti!;
      }
      return result;
    }
    return result;
  }

  int totalPriceOneProdct({required String productId}) {
    int result = 0;
    if (cardPurchases.isNotEmpty) {
      result = 0;

      for (var item in cardPurchases) {
        if (item.forProduct == productId) {
          result += int.parse(item.products!.price!) * item.quantiti!;
          item.totalPrice = result;
        }
      }
      return result;
    }
    return result;
  }

  int quantity = 1;
  void addQuantity(int index) {
    if (cardPurchases[index].quantiti! < 50) {
      quantity =
          cardPurchases[index].quantiti = cardPurchases[index].quantiti! + 1;
      emit(AddQuantity());
    }
  }

  void removeQuantity(int index) {
    if (cardPurchases[index].quantiti! > 1) {
      quantity =
          cardPurchases[index].quantiti = cardPurchases[index].quantiti! - 1;
      emit(RemoveQuantity());
    }
  }
}
