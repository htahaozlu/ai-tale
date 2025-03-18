import 'package:flutter/material.dart';
import 'package:ai_tale/widgets/custom_card.dart';
import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/ai_tale_logo.svg',
                    height: 32,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      title: 'Write',
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
                      title: 'Visualize',
                      height: 120,
                      width: double.infinity,
                      onTap: () {},
                      gradient: AppColors.cardGradient,
                      imagePath: 'assets/images/backgrounds/visualize.png',
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'You may like',
                      style: AppTextStyles.subtitle,
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
                                title: 'Fairy',
                                imagePath: 'assets/images/backgrounds/magic_forest.jpg',
                                onTap: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 160,
                              child: CustomCard(
                                title: 'Fairy',
                                imagePath: 'assets/images/backgrounds/medieval_castle.jpg',
                                onTap: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: 160,
                              child: CustomCard(
                                title: 'Space',
                                imagePath: 'assets/images/backgrounds/space_adventure.jpg',
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