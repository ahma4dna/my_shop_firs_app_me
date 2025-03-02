import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      primaryColor:
          isDarkTheme ? AppColor.darkPrimaryColor : AppColor.lightPrimaryColor,
      scaffoldBackgroundColor:
          isDarkTheme ? AppColor.darkScaffoldColor : AppColor.lightNavBarColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,

      // تخصيص شريط التطبيق (AppBar)
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDarkTheme
              ? AppColor.lightBackgroundColor
              : AppColor.darkScaffoldColor,
        ),
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        backgroundColor: isDarkTheme
            ? AppColor.darkScaffoldColor
            : AppColor.lightNavBarColor,
        elevation: 0,
      ),

      // تخصيص شريط التنقل (NavigationBar)
      navigationBarTheme: NavigationBarThemeData(
        height: kBottomNavigationBarHeight + 30,
        backgroundColor: isDarkTheme
            ? AppColor.darkScaffoldColor
            : AppColor.lightNavBarColor, // خلفية شريط التنقل
        indicatorColor: isDarkTheme
            ? Color(0xFF64B5F6)
            : Color(0xFFBBDEFB), // اللون المحدد للأيقونات

        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            return TextStyle(
              color: states.contains(MaterialState.selected)
                  ? (isDarkTheme
                      ? AppColor.darkPrimaryColor
                      : AppColor.lightPrimaryColor) // لون النص عند التحديد
                  : (isDarkTheme
                      ? Colors.white
                      : Colors.black), // لون النص عند عدم التحديد
              fontSize: states.contains(MaterialState.selected)
                  ? 16
                  : 12, // تكبير النص عند التحديد
              fontWeight: states.contains(MaterialState.selected)
                  ? FontWeight.bold
                  : FontWeight.normal, // زيادة الوزن عند التحديد
            );
          },
        ),

        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (Set<MaterialState> states) {
            return IconThemeData(
              color: states.contains(MaterialState.selected)
                  ? (isDarkTheme
                      ? AppColor.darkPrimaryColor
                      : AppColor.lightPrimaryColor) // لون الأيقونة عند التحديد
                  : (isDarkTheme
                      ? Colors.white
                      : Colors.black), // لون الأيقونة عند عدم التحديد
            );
          },
        ),

        elevation: 5, // ارتفاع شريط التنقل
      ),

      // تخصيص مدخلات النصوص (TextField)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor:
            isDarkTheme ? AppColor.darkNavBarColor : AppColor.lightNavBarColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkTheme
                ? AppColor.darkPrimaryColor
                : AppColor.lightPrimaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // تخصيص الأزرار (ElevatedButton)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isDarkTheme
                ? AppColor.darkPrimaryColor
                : AppColor.lightPrimaryColor,
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class AppColor {
  // 🎨 ألوان الثيم الداكن (ChatGPT Dark Theme)
  static const Color darkScaffoldColor = Color(0xFF202123); // خلفية داكنة
  static const Color darkBackgroundColor = Color(0xFF343541); // خلفية ثانوية
  static const Color darkPrimaryColor =
      Color(0xFF1E88E5); // اللون الأزرق الأساسي
  static const Color darkTextColor =
      Color(0xFFEDEDED); // لون النص الأبيض الفاتح
  static const Color darkCardColor = Color(0xFF2B2C2F); // لون البطاقات الداكن
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
