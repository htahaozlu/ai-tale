import 'package:flutter/material.dart';
import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/text_styles.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomInput({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    AppColors.setTheme(themeProvider.isDarkMode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            fontSize: themeProvider.fontSize,
            height: themeProvider.lineHeight,
            letterSpacing: themeProvider.letterSpacing,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            fontSize: themeProvider.fontSize,
            height: themeProvider.lineHeight,
            letterSpacing: themeProvider.letterSpacing,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
            suffixIcon: suffixIcon,
            hintText: 'Enter your ${label.toLowerCase()}',
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: themeProvider.fontSize,
              height: themeProvider.lineHeight,
              letterSpacing: themeProvider.letterSpacing,
            ),
          ),
        ),
      ],
    );
  }
}