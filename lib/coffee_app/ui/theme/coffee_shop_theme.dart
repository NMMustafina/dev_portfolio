import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

const _fontFamily = FontFamily.sora;

const textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _fontFamily,
  ),
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.5,
    fontFamily: _fontFamily,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    fontFamily: _fontFamily,
  ),
  labelLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  ),
);

final darkCoffeeShopTheme = ThemeData(
  fontFamily: _fontFamily,
  brightness: Brightness.dark,
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFC67C4E),
    brightness: Brightness.dark,
  ),
);

final lightCoffeeShopTheme = ThemeData(
  fontFamily: _fontFamily,
  brightness: Brightness.light,
  textTheme: textTheme,
  scaffoldBackgroundColor: Color(0xFFF6F6F6),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFC67C4E),
    brightness: Brightness.light,
  ),
);

final fitnessAppTheme = ThemeData(
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      fontSize: 36,
      letterSpacing: 0.4,
      height: 0.9,
      color: Color(0xFF17262A),
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.27,
      color: Color(0xFF17262A),
    ),
    titleSmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.18,
      color: Color(0xFF17262A),
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.2,
      color: Color(0xFF253840),
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: -0.05,
      color: Color(0xFF253840),
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.2,
      color: Color(0xFF4A6572),
    ),
  ),
  scaffoldBackgroundColor: Color(0xFFF2F3F8),
  colorScheme: ColorScheme.light().copyWith(
    primary: Color(0xFF00B6F0),
    secondary: Color(0xFF00B6F0),
    background: Color(0xFFF2F3F8),
  ),
);

class ThemeManager extends ChangeNotifier {
  ThemeData _currentTheme = lightCoffeeShopTheme;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
