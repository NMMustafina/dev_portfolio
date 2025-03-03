import 'package:flutter/material.dart';

class CoffeeTheme {
  const CoffeeTheme();

  // Основные цвета
  static const Color primaryColor = Color(0xFFC67C4E);
  static const Color secondaryColor = Color(0xFFFFFFFF);

  static const Color primaryTextColor = Color(0xFF242424);
  static const Color secondaryTextColor = Color(0xFFA2A2A2);

  static const Color backgroundColor = Color(0xFFF9F9F2);
  static const Color darkBackgroundColor = Color(0xFF000000);

  static const Color searchFieldColor = Color(0xFF424242);
  static const Color promoColor = Color(0xFFED5151);
  static const Color ratingStarColor = Color(0xFFFBBE21);
  static const Color navigationInactiveColor = Color(0xFFA2A2A2);
  static const Color navigationActiveColor = primaryColor;

  // Основной шрифт
  static const String fontFamily = 'Sora';

  ThemeData get themeData {
    return ThemeData(
      fontFamily: fontFamily,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      secondaryHeaderColor: secondaryTextColor,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          color: secondaryColor,
          height: 1.5,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          color: primaryTextColor,
          height: 1.5,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          color: primaryTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          color: secondaryTextColor,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          color: secondaryTextColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: secondaryColor,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: fontFamily,
          ),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: searchFieldColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
          color: secondaryTextColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: navigationActiveColor,
        unselectedItemColor: navigationInactiveColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
      ),
    );
  }

  static BoxDecoration ratingContainerDecoration = BoxDecoration(
    color: Color.fromRGBO(0, 0, 0, 0.2),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(30),
    ),
  );
}
