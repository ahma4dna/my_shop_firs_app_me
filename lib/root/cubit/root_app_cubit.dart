import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_shop/core/compnds/text/custton_title_text.dart';
import 'package:my_shop/featurers/explor/view/explor_view.dart';
import 'package:my_shop/featurers/home/view/home_view.dart';
import 'package:my_shop/featurers/search/view/search_view.dart';
import 'package:my_shop/featurers/setaings/view/seting_view.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'root_app_state.dart';

enum AppThemeMode { system, light, dark }

class RootAppCubit extends Cubit<RootAppState> {
  RootAppCubit() : super(RootAppInitial());
  bool hasInternet = true;

Future<void> initInternetConnection() async {
  hasInternet = await InternetConnectionChecker.instance.hasConnection;
  emit(InternetConnectionChanged(hasInternet));

  InternetConnectionChecker.instance.onStatusChange.listen((status) {
    hasInternet = status == InternetConnectionStatus.connected;
    emit(InternetConnectionChanged(hasInternet));
  });
}

  List<Widget> pages = [
    HomeView(),
    SearchView(),
    ExplorView(),
    SetingView(),
  ];

  List<Widget> pagesNoNet = [
    Center(
      child: CusttonTitleText(
        text: " لا يوجد إتصال بالانترنت يرجي الاتصال",
        fontSize: 68.sp,
      ),
    ),
    Center(
      child: CusttonTitleText(
        text: " لا يوجد إتصال بالانترنت يرجي الاتصال",
        fontSize: 68.sp,
      ),
    ),
   Center(
      child: CusttonTitleText(
        text: " لا يوجد إتصال بالانترنت يرجي الاتصال",
        fontSize: 68.sp,
      ),
    ),
    Center(
      child: CusttonTitleText(
        text: " لا يوجد إتصال بالانترنت يرجي الاتصال",
        fontSize: 68.sp,
      ),
    ),
  ];
  List<RiveIcon> icon = [
    RiveIcon.home2,
    RiveIcon.unlock,
    RiveIcon.search,
    RiveIcon.dislike,
    RiveIcon.profile,
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
