import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static  TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static  TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
  );

  static TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static  TextStyle cardTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static  TextStyle subtitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static  TextStyle bottomNavText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 12,
    fontFamily: 'Inter',
  );

  static TextStyle bottomNavTextSelected = const TextStyle(
    color: AppColors.primary,
    fontSize: 12,
    fontFamily: 'Inter',
  );

  static  TextStyle inputText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontFamily: 'Inter',
  );

  static  TextStyle inputHint = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
    fontFamily: 'Inter',
  );

  static TextStyle inputCounter = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontFamily: 'Inter',
  );
}