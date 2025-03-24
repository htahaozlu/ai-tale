import 'package:flutter/material.dart';
import 'package:ai_tale/widgets/custom_card.dart';
import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    AppColors.setTheme(themeProvider.isDarkMode);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40), // Placeholder for left alignment
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/ai_tale_logo.svg',
                  height: 32,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/main', arguments: 3);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/backgrounds/profile.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      title: Text(
                        'Write',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      height: 180,
                      width: double.infinity,
                      showButton: true,
                      buttonText: 'Create',
                      onTap: () {
                        Navigator.pushNamed(context, '/character-selection');
                      },
                      imagePath: 'assets/images/backgrounds/write.png',
                      gradient: AppColors.primaryGradient,
                    ),
                    const SizedBox(height: 16),
                    CustomCard(
                      title: Text(
                        'Visualize',
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      height: 120,
                      width: double.infinity,
                      onTap: () {},
                      gradient: AppColors.cardGradient,
                      imagePath: 'assets/images/backgrounds/visualize.png',
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'You may like',
                      style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: themeProvider.fontSize,
                        height: themeProvider.lineHeight,
                        letterSpacing: themeProvider.letterSpacing,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 160,
                              child: CustomCard(
                                title: Text(
                                  'Fairy',
                                  style:
                                      TextStyle(color: AppColors.textPrimary),
                                ),
                                imagePath:
                                    'assets/images/backgrounds/magic_forest.jpg',
                                onTap: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 160,
                              child: CustomCard(
                                title: Text(
                                  'Castle',
                                  style:
                                      TextStyle(color: AppColors.textPrimary),
                                ),
                                imagePath:
                                    'assets/images/backgrounds/medieval_castle.jpg',
                                onTap: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 160,
                              child: CustomCard(
                                title: Text(
                                  'Space',
                                  style:
                                      TextStyle(color: AppColors.textPrimary),
                                ),
                                imagePath:
                                    'assets/images/backgrounds/space_adventure.jpg',
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
