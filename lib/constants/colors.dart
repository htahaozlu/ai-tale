import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF8A84FF);

  static const Color background = Color(0xFF1A1A2E);
  static const Color cardBackground = Color(0xFF2D3142);
  static const Color cardBackgroundLight = Color(0xFF4A4D63);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color.fromRGBO(255, 255, 255, 0.54);

  static const Color cardBackgroundTransparent = Color.fromRGBO(45, 49, 66, 0.5);
  static const Color overlayBackgroundDark = Color.fromRGBO(0, 0, 0, 0.7);
  static const Color shadowColorValue = Color.fromRGBO(0, 0, 0, 0.2);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cardBackground, cardBackgroundLight],
  );

  static const LinearGradient overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      overlayBackgroundDark,
    ],
  );
}