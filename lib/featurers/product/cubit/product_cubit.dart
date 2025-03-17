import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:my_shop/core/data/remoat/api_dio.dart';
import 'package:my_shop/core/function/show_snak_bar.dart';
import 'package:my_shop/featurers/product/model/product_model.dart';
import 'package:my_shop/featurers/product/model/review_model/review_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:meta/meta.dart';

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
  int totaRating = 0;
  int toatlRateCount = 0;
  int rate1 = 0;
  int rate2 = 0;
  int rate3 = 0;
  int rate4 = 0;
  int rate5 = 0;
  bool isLoadingriv = true;
  ReviewModel? reviewModel;
  int? rateuser = 0;
  String? nameUser, commentUser, date, id;
  Future<void> getReview({required String productId}) async {
    //restart
    id = null;
    rateuser = null;
    nameUser = null;
    commentUser = null;
    date = null;
    reviews = [];
    rate1 = 0;
    rate2 = 0;
    rate3 = 0;
    rate4 = 0;
    rate4 = 0;
    rate5 = 0;
    totaRating = 0;
    toatlRateCount = 0;
//start
    emit(GetReviewLoading());
    try {
      final data = await _apiDio.getData(
          path: "review?select=*,users(*)&for_product=eq.$productId");

      if (data.statusCode == 200) {
        for (var reviwe in data.data) {
          reviews.add(ReviewModel.fromJson(reviwe));
        }
        if (reviews.isNotEmpty) {
          for (var rate in reviews) {
            if (rate.rate != null) {
              totaRating = totaRating + rate.rate!;
            }
          }
          if (totaRating != 0 && totaRating != null) {
            totaRating = (totaRating / reviews.length).toInt();
          }
        }

        if (reviews.isNotEmpty) {
          for (var rate in reviews) {
            if (rate.rate != null) {
              toatlRateCount = toatlRateCount + 1;
            }
          }
        }
        if (reviews.isNotEmpty) {
          for (var rate in reviews) {
            if (rate.rate == 1) {
              rate1 = rate1 + 1;
            } else if (rate.rate == 2) {
              rate2 = rate2 + 1;
            } else if (rate.rate == 3) {
              rate3 = rate3 + 1;
            } else if (rate.rate == 4) {
              rate4 = rate4 + 1;
            } else if (rate.rate == 5) {
              rate5 = rate5 + 1;
            }
          }
        }
        if (reviews.isNotEmpty) {
          for (var rev in reviews) {
            if (Supabase.instance.client.auth.currentUser!.id == rev.forUser) {
              rateuser = rev.rate;
              nameUser = rev.users!.name;
              commentUser = rev.comment;
              date = rev.createdAt;
              id = rev.idReviwe;
            }
          }
          // log(reviewModel!.rate.toString());
        }

        emit(GetReviewSucecc());
      }
    } catch (e) {
      log(e.toString());
      emit(GetReviewErorr());
    } finally {
      //end
      isLoadingriv = false;
    }
  }

  Future<void> updateReview(
      {required String idRev,
      required String productId,
      required Map<String, dynamic> data,required BuildContext context}) async {
    emit(PutReviewLoading());
    try {
      await _apiDio.putDat(
        path: "review?id_reviwe=eq.$idRev",
        data: data,
      );

      
      if (state is PutReviewSucecc) {
        await getReview(productId: productId);
      }
      emit(PutReviewSucecc());
    } catch (e) {
      emit(PutReviewErorr());
      log(e.toString());
    }finally{
        showSnakBar(context, "تم تعديل المراجعة");
    }
  }


    Future<void> postReview(
      {
      required String productId,
      required Map<String, dynamic> data,required BuildContext context}) async {
    emit(PostReviewLoading());
    try {
      await _apiDio.postData(
        path: "review",
        data: data,
      );

      if (state is PostReviewSucecc) {
        await getReview(productId: productId);
      }
            emit(PostReviewSucecc());

    } catch (e) {
      emit(PostReviewErorr());
      log(e.toString());
    }finally{
        showSnakBar(context, "تم نشر المراجعة");


    }
  }
}
