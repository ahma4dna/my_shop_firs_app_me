import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:my_shop/core/data/remoat/api_dio.dart';
import 'package:my_shop/featurers/inner_feature/recently/model/recently_model/recently_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'recently_state.dart';

class RecentlyCubit extends Cubit<RecentlyState> {
  RecentlyCubit() : super(RecentlyInitial());
  final ApiDio _apiDio = ApiDio();
  List<RecentlyModel> recentlyList = [];
  Future<void> getRecently() async {
    recentlyList = [];
    emit(GetRecentlyLoading());
    try {
      final response = await _apiDio.getData(
        path:
            "recently_table?select=*,products(*)&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}",
      );

      for (var element in response.data) {
        recentlyList.add(RecentlyModel.fromJson(element));
      }
      emit(GetRecentlySucecc());
    } catch (e) {
      log(e.toString());
      emit(GetRecentlyErorr());
    }
  }

  Future<void> addRecently(
      {required Map<String, dynamic> data, required String productId}) async {
    await getRecently();
    if (isRecently(productId: productId)) {
      recentlyList = [];
      emit(AddRecentlyLoading());
      try {
        // ignore: unused_local_variable
        final response = await _apiDio.postData(
            path:
                "recently_table?select=*,products(*)&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}",
            data: data);

        emit(AddRecentlySucecc());
      } catch (e) {
        emit(AddtRecentlyErorr());
      }
    } else {
      return;
    }
  }

  Future<void> clearOneRecently({required String id}) async {
    emit(ClearOneRecentlyLoading());
    try {
      // ignore: unused_local_variable
      final response = await _apiDio.delatAll(
        path:
            "recently_table?select=*,products(*)&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}&id=eq.$id",
      );
      await getRecently();

      emit(ClearOneRecentlySucecc());
    } catch (e) {
      emit(ClearOneRecentlyErorr());
    }
  }

  Future<void> clearAllRecently() async {
    emit(ClearAllRecentlyLoading());
    try {
      // ignore: unused_local_variable
      final response = await _apiDio.delatAll(
        path:
            "recently_table?select=*,products(*)&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}",
      );
      await getRecently();

      emit(ClearAllRecentlySucecc());
    } catch (e) {
      emit(ClearAllRecentlyErorr());
    }
  }

  bool isRecently({required String productId}) {
    for (var element in recentlyList) {
      if (element.forProduct == productId) {
        return false;
      }
    }
    return true;
  }
}
