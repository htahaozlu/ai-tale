import 'package:flutter/material.dart';
import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/text_styles.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? imagePath;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final bool showButton;
  final String? buttonText;
  final LinearGradient? gradient;

  const CustomCard({
    super.key,
    required this.title,
    this.imagePath,
    required this.onTap,
    this.height = 180,
    this.width,
    this.showButton = false,
    this.buttonText,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: gradient ?? AppColors.cardGradient, // 📌 Varsayılan gradient
          color: gradient == null && imagePath == null ? AppColors.cardBackground : null, // 📌 Varsayılan renk
          image: imagePath != null
              ? DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.cover,
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColorValue,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: gradient == null ? AppColors.overlayGradient : null, // 📌 Eğer gradient varsa overlay ekleme
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.cardTitle,
              ),
              if (showButton) ...[
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    buttonText ?? 'Create',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
