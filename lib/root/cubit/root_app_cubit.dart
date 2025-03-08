import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/featurers/cart/view/cart_view.dart';
import 'package:my_shop/featurers/explor/view/explor_view.dart';
import 'package:my_shop/featurers/home/view/home_view.dart';
import 'package:my_shop/featurers/search/view/search_view.dart';
import 'package:my_shop/featurers/setaings/view/seting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'root_app_state.dart';

class RootAppCubit extends Cubit<RootAppState> {
  RootAppCubit() : super(RootAppInitial());
  List<Widget> pages = [
    HomeView(),
    CartView(),
    SearchView(),
    ExplorView(),
    SetingView(),
  ];
   List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
      GlobalKey<NavigatorState>(),
        GlobalKey<NavigatorState>(),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(RootAppChangeIndex());
  }

  List<NavigationDestination> destinations = [
    NavigationDestination(
      icon: Icon(IconlyLight.home),
      label: "الرئيسية",
      selectedIcon: Icon(IconlyBold.home),
    ),
    NavigationDestination(
      icon: Icon(IconlyLight.bag_2),
      label: "السلة",
      selectedIcon: Icon(IconlyBold.bag_2),
    ),
    NavigationDestination(
      icon: Icon(IconlyLight.search),
      label: "البحث",
      selectedIcon: Icon(IconlyBold.search),
    ),
    NavigationDestination(
      icon: Icon(IconlyLight.discovery),
      label: "استكشاف",
      selectedIcon: Icon(IconlyBold.discovery),
    ),
    NavigationDestination(
      icon: Icon(IconlyLight.profile),
      label: "حسابي",
      selectedIcon: Icon(IconlyBold.profile),
    ),
  ];

  bool isDark = false;
  bool get getDark => isDark;
  
  Future<void> setTheam({required bool theameValue}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("THEM", theameValue);
    isDark = theameValue;
    emit(SaveTheme());
  }

  Future<void> getTheam() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDark = prefs.getBool("THEM") ?? false;
    log('Theme saved: ${prefs.getBool("THEM") ?? false}');
    emit(GetTheame());
  }


}
