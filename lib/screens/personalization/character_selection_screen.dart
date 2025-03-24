import 'package:flutter/material.dart';
import 'package:ai_tale/widgets/custom_card.dart';
import 'package:ai_tale/constants/text_styles.dart';

class CharacterSelectionScreen extends StatelessWidget {
  const CharacterSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characters = [
      {'name': 'Wizard', 'image': 'assets/images/backgrounds/wizard.jpg'},
      {'name': 'Knight', 'image': 'assets/images/backgrounds/knight.jpg'},
      {'name': 'Princess', 'image': 'assets/images/backgrounds/princess.jpg'},
      {'name': 'Dinosaur', 'image': 'assets/images/backgrounds/dinosaur.jpg'},
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
                      'Choose Your Character',
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
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    title: Text(characters[index]['name']!),
                    imagePath: characters[index]['image']!,
                    onTap: () {
                      Navigator.pushNamed(context, '/theme-selection');
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