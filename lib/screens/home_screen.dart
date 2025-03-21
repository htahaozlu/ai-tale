import 'package:ai_tale/constants/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ai_tale/widgets/custom_card.dart';
import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    // Placeholder for HomeScreen or other pages you want to navigate to
    Container(),  
    Container(),  
  ];

  // Bottom navigation item tap handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // 📌 Tüm ekranın arka planı
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
                      gradient: AppColors.primaryGradient,
                      imagePath: 'assets/images/backgrounds/write.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/character-selection');
                      },
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You may like',
                          style: AppTextStyles.textbutton,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/suggested-stories');
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCardItem('Fairy', 'assets/images/backgrounds/magic_forest.jpg'),
                          _buildCardItem('Castle', 'assets/images/backgrounds/medieval_castle.jpg'),
                          _buildCardItem('Space', 'assets/images/backgrounds/space_adventure.jpg'),
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
      bottomNavigationBar: CustomBottomNavBar(onItemTapped: _onItemTapped), // Pass onItemTapped here
    );
  }

  Widget _buildCardItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 160,
        child: CustomCard(
          title: title,
          imagePath: imagePath,
          onTap: () {},
        ),
      ),
    );
  }
}
