import 'package:flutter/material.dart';

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
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/profile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
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
                    const Expanded(
                      child: Text(
                        'Select Theme',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 40), // To balance the back button
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: themes.length,
                  itemBuilder: (context, index) {
                    return ThemeCard(
                      name: themes[index]['name']!,
                      imagePath: themes[index]['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const ThemeCard({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement theme selection
        Navigator.pushNamed(context, '/story-creation');
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}