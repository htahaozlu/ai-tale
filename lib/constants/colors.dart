import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF8A84FF);

  // Dark Theme Colors
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color cardBackgroundDark = Color(0xFF2D3142);
  static const Color cardBackgroundLightDark = Color(0xFF4A4D63);
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color.fromRGBO(255, 255, 255, 0.54);

  // Light Theme Colors
  static const Color backgroundLight = Color(0xFFF5F5F7);
  static const Color cardBackgroundLight = Color(0xFFFFFFFF);
  static const Color cardBackgroundLightLight = Color(0xFFF0F0F5);
  static const Color textPrimaryLight = Color(0xFF2D3142);
  static const Color textSecondaryLight = Color(0xFF666B7A);

  // Dynamic Colors (will change based on theme)
  static late Color background;
  static late Color cardBackground;
  static late Color cardBackgroundLighter;
  static late Color textPrimary;
  static late Color textSecondary;

  static const Color cardBackgroundTransparent = Color.fromRGBO(45, 49, 66, 0.5);
  static const Color overlayBackgroundDark = Color.fromRGBO(0, 0, 0, 0.7);
  static const Color shadowColorValue = Color.fromRGBO(0, 0, 0, 0.2);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static LinearGradient get cardGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cardBackground, cardBackgroundLighter],
  );

  static const LinearGradient overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      overlayBackgroundDark,
    ],
  );

  static void setTheme(bool isDark) {
    background = isDark ? backgroundDark : backgroundLight;
    cardBackground = isDark ? cardBackgroundDark : cardBackgroundLight;
    cardBackgroundLighter = isDark ? cardBackgroundLightDark : cardBackgroundLightLight;
    textPrimary = isDark ? textPrimaryDark : textPrimaryLight;
    textSecondary = isDark ? textSecondaryDark : textSecondaryLight;
  }
}