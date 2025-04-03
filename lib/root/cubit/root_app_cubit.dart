import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/cart/view/cart_view.dart';
import 'package:my_shop/featurers/explor/view/explor_view.dart';
import 'package:my_shop/featurers/home/view/home_view.dart';
import 'package:my_shop/featurers/search/view/search_view.dart';
import 'package:my_shop/featurers/setaings/view/seting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'root_app_state.dart';

enum AppThemeMode { system, light, dark }

class RootAppCubit extends Cubit<RootAppState> {
  RootAppCubit() : super(RootAppInitial());
  List<Widget> pages = [
    HomeView(),
    CartView(),
    SearchView(),
    ExplorView(),
    SetingView(),
  ];

  int currentIndex = 0;
  late PageController pageController;
  PageController get getPageCon => pageController;
  void setPageControler(PageController pageCon) {
    pageController = pageCon;
  }

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
      icon: Badge(
          backgroundColor: Colors.red,
          label: CusttonTitleText(
            text: "3",
            fontSize: 12,
          ),
          child: Icon(IconlyLight.bag_2)),
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

  AppThemeMode themeMode = AppThemeMode.system; // الوضع الافتراضي

  Future<void> setTheme(AppThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("THEME_MODE", mode.toString());
    themeMode = mode;
    emit(ThemeChanged());
  }

  Future<void> loadTheme() async {
    // log(Supabase.instance.client.auth.currentUser!.id.toString()??"");
    final prefs = await SharedPreferences.getInstance();
    String? storedMode = prefs.getString("THEME_MODE");

    if (storedMode == AppThemeMode.light.toString()) {
      themeMode = AppThemeMode.light;
    } else if (storedMode == AppThemeMode.dark.toString()) {
      themeMode = AppThemeMode.dark;
    } else {
      themeMode = AppThemeMode.system;
    }

    emit(ThemeLoaded());
  }
}
