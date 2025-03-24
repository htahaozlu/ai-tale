import 'package:ai_tale/screens/home/home_screen.dart';
import 'package:ai_tale/screens/profile/profile_screen.dart';
import 'package:ai_tale/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_navigation.dart';
import 'library/library_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
