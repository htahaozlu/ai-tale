import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/navigation_bar.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  // Define a function to handle bottom navigation item taps
  void _onItemTapped(int index) {
    // Add your navigation logic here (e.g., update index or navigate to different screens)
    print("Selected index: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/blog2.jpg",
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Read time: 4 min",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "The Little Fairy",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Once upon a time, in a magical forest, there lived a little fairy named Lily. "
                "Lily was very small and had delicate wings that sparkled in the sunlight. "
                "She loved to fly around the forest and play with all the creatures that lived there.\n\n"
                "One day, while playing with some baby rabbits, Lily heard a loud noise coming from a nearby pond. "
                "She flew over to investigate and found that a group of frogs had accidentally gotten stuck in a thorny bush. "
                "Lily knew she had to help the frogs, so she used her fairy magic... "
                "Once upon a time, in a magical forest, there lived a little fairy named Lily. "
                "Lily was very small and had delicate wings that sparkled in the sunlight. "
                "She loved to fly around the forest and play with all the creatures that lived there.\n\n"
                "One day, while playing with some baby rabbits, Lily heard a loud noise coming from a nearby pond. "
                "She flew over to investigate and found that a group of frogs had accidentally gotten stuck in a thorny bush. "
                "Lily knew she had to help the frogs, so she used her fairy magic...",
                style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(onItemTapped: _onItemTapped), // Pass the onItemTapped function here
    );
  }
}
