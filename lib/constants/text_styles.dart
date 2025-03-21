import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textbutton= TextStyle(
    color: AppColors.textbuttoncl,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold
  );

  static const TextStyle cardTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle navbar = TextStyle(
    color: AppColors.textbottombar,
    fontSize: 9.32,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bottomNavText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 12,
    fontFamily: 'Inter',
  );

  static TextStyle bottomNavTextSelected = const TextStyle(
    color: AppColors.primary,
    fontSize: 12,
    fontFamily: 'Inter',
  );

  static const TextStyle inputText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontFamily: 'Inter',
  );

  static const TextStyle inputHint = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
    fontFamily: 'Inter',
  );

  static const TextStyle inputCounter = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontFamily: 'Inter',
  );
}