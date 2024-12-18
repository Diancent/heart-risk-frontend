import 'package:flutter/material.dart';

class AppTheme {
  // Основні кольори
  static const Color primaryColor = Color(0xFF00BFA6); // Бірюзовий колір
  static const Color backgroundColor = Color(0xFFFFFFFF); // Темний фон
  static const Color accentColor = Color(0xFF1DE9B6); // Світлий акцент

  // Світла тема
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white, // Колір фону
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: accentColor,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.light(
      primary: accentColor,
      secondary: accentColor,
      background: primaryColor,
    ),
  );
}