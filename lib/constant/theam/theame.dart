import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(),
        backgroundColor: AppColor.lightScaffoldColor,
      ),
      dividerColor: Colors.black,
      primaryColor: AppColor.lightPrimaryColor,
      scaffoldBackgroundColor: AppColor.lightScaffoldColor,
      brightness: Brightness.light,

      // تخصيص شريط التطبيق (AppBar)
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.darkScaffoldColor),
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: AppColor.lightScaffoldColor,
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: Colors.black),

      // تخصيص شريط التنقل (NavigationBar)
      navigationBarTheme: NavigationBarThemeData(
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        height: kBottomNavigationBarHeight + 25,
        backgroundColor: AppColor.lightScaffoldColor,
        indicatorColor: Color(0xFFBBDEFB),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            return TextStyle(
              color: states.contains(MaterialState.selected)
                  ? AppColor.lightPrimaryColor
                  : Colors.black,
              fontSize: states.contains(MaterialState.selected) ? 16 : 12,
              fontWeight: states.contains(MaterialState.selected)
                  ? FontWeight.bold
                  : FontWeight.normal,
            );
          },
        ),
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (Set<MaterialState> states) {
            return IconThemeData(
              color: states.contains(MaterialState.selected)
                  ? AppColor.lightPrimaryColor
                  : Colors.black,
            );
          },
        ),
      ),

      // تخصيص مدخلات النصوص (TextField)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: AppColor.lightNavBarColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.lightPrimaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // تخصيص الأزرار (ElevatedButton)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.lightPrimaryColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.black),
          ),
        ),
      ),
      cardColor: AppColor.lightBackgroundColor,
      cardTheme: CardTheme(
        color: AppColor.lightBackgroundColor,
      ),
    );
  }
}

class DarkTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(),
        backgroundColor: AppColor.primaryDarkColor,
      ),
      dividerColor: Colors.white,
      primaryColor: AppColor.darkPrimaryColor,
      scaffoldBackgroundColor: AppColor.primaryDarkColor,
      brightness: Brightness.dark,

      // تخصيص شريط التطبيق (AppBar)
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.lightBackgroundColor),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: AppColor.primaryDarkColor,
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: Colors.white),

      // تخصيص شريط التنقل (NavigationBar)
      navigationBarTheme: NavigationBarThemeData(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        height: kBottomNavigationBarHeight + 25,
        backgroundColor: AppColor.primaryDarkColor,
        indicatorColor: Color(0xFF64B5F6),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            return TextStyle(
              color: states.contains(MaterialState.selected)
                  ? AppColor.darkPrimaryColor
                  : Colors.white,
              fontSize: states.contains(MaterialState.selected) ? 16 : 12,
              fontWeight: states.contains(MaterialState.selected)
                  ? FontWeight.bold
                  : FontWeight.normal,
            );
          },
        ),
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (Set<MaterialState> states) {
            return IconThemeData(
              color: states.contains(MaterialState.selected)
                  ? AppColor.darkPrimaryColor
                  : Colors.white,
            );
          },
        ),
      ),

      // تخصيص مدخلات النصوص (TextField)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: AppColor.darkNavBarColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.darkPrimaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // تخصيص الأزرار (ElevatedButton)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.darkPrimaryColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
      ),
      cardColor: AppColor.darkCardColor,
      cardTheme: CardTheme(
        color: AppColor.darkCardColor,
      ),
    );
  }
}


class AppColor {
  // 🎨 ألوان الثيم الداكن (ChatGPT Dark Theme)

  static const Color primaryDarkColor = Color(0xFF121212); // أسود داكن;
  static const Color darkScaffoldColor = Color(0xFF202123); // خلفية داكنة
  static const Color darkBackgroundColor = Color(0xFF343541); // خلفية ثانوية
  static const Color darkPrimaryColor =
      Color(0xFF1E88E5); // اللون الأزرق الأساسي
  static const Color darkTextColor =
      Color(0xFFEDEDED); // لون النص الأبيض الفاتح
  static const Color darkCardColor =
      Color(0xFF2E2E2E); // رمادي غامق; // لون البطاقات الداكن
  static const Color darkNavBarColor =
      Color(0xFF1E1E1E); // لون شريط التنقل في الثيم الداكن
  static const Color darkNavBarSelectedColor =
      Color(0xFF1E88E5); // اللون المحدد في شريط التنقل

  // ☀️ ألوان الثيم الفاتح (ChatGPT Light Theme)
  static const Color lightScaffoldColor = Color(0xFFFFFFFF); // الخلفية بيضاء
  static const Color lightBackgroundColor =
      Color(0xFFF7F7F8); // خلفية ثانوية رمادية فاتحة
  static const Color lightPrimaryColor =
      Color(0xFF1E88E5); // اللون الأزرق الأساسي
  static const Color lightTextColor =
      Color(0xFF202123); // لون النص الأسود الداكن
  static const Color lightCardColor = Color(0xFFE3E4E8); // لون البطاقات الفاتح
  static const Color lightNavBarColor =
      Color(0xFFF7F7F8); // لون شريط التنقل في الثيم الفاتح
}
