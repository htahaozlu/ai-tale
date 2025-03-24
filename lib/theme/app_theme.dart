import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const double smallFontSize = 14.0;
  static const double mediumFontSize = 16.0;
  static const double largeFontSize = 18.0;
  static const Color errorColor = Color(0xFFFF6B6B);

  static ThemeData lightTheme(String colorTheme, double fontSize, bool isHighContrast) {
    final Map<String, Color> themeColors = {
      'default': Colors.blue,
      'magical_forest': Colors.green[700]!,
      'ocean_blue': Colors.blue[700]!,
      'royal_purple': Colors.purple[700]!,
    };

    final primaryColor = themeColors[colorTheme] ?? themeColors['default']!;

    return ThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: isHighContrast ? Colors.white : Colors.grey[50],
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: fontSize,
          color: isHighContrast ? Colors.black : Colors.grey[800],
        ),
        bodyMedium: TextStyle(
          fontSize: fontSize - 2,
          color: isHighContrast ? Colors.black : Colors.grey[800],
        ),
        titleLarge: TextStyle(
          fontSize: fontSize + 4,
          fontWeight: FontWeight.bold,
          color: isHighContrast ? Colors.black : Colors.grey[900],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(String colorTheme, double fontSize, bool isHighContrast) {
    final Map<String, Color> themeColors = {
      'default': Colors.blue[400]!,
      'magical_forest': Colors.green[400]!,
      'ocean_blue': Colors.blue[400]!,
      'royal_purple': Colors.purple[400]!,
    };

    final primaryColor = themeColors[colorTheme] ?? themeColors['default']!;

    return ThemeData(
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: isHighContrast ? Colors.black : Colors.grey[900],
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: fontSize,
          color: isHighContrast ? Colors.white : Colors.grey[300],
        ),
        bodyMedium: TextStyle(
          fontSize: fontSize - 2,
          color: isHighContrast ? Colors.white : Colors.grey[300],
        ),
        titleLarge: TextStyle(
          fontSize: fontSize + 4,
          fontWeight: FontWeight.bold,
          color: isHighContrast ? Colors.white : Colors.grey[100],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}