import 'package:flutter/material.dart';
import 'package:ai_tale/widgets/custom_card.dart';
import 'package:ai_tale/constants/text_styles.dart';

class ThemeSelectionScreen extends StatelessWidget {
  const ThemeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = [
      {'name': 'Space Adventure', 'image': 'assets/images/backgrounds/space_adventure.jpg'},
      {'name': 'Magic Forest', 'image': 'assets/images/backgrounds/magic_forest.jpg'},
      {'name': 'Medieval Castle', 'image': 'assets/images/backgrounds/medieval_castle.jpg'},
      {'name': 'Ocean', 'image': 'assets/images/backgrounds/ocean.jpg'},
      {'name': 'Cyberpunk', 'image': 'assets/images/backgrounds/cyberpunk.jpg'},
      {'name': 'Land of Candies', 'image': 'assets/images/backgrounds/land_of_candies.jpg'},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Select Theme',
                      style: AppTextStyles.heading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: themes.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    title: themes[index]['name']!,
                    imagePath: themes[index]['image']!,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/write-tale');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}