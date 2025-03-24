import 'package:flutter/material.dart';
import 'package:ai_tale/screens/home/home_screen.dart';
import 'package:ai_tale/screens/search/search_screen.dart';
import 'package:ai_tale/screens/library/library_screen.dart';
import 'package:ai_tale/screens/profile/profile_screen.dart';
import 'package:ai_tale/widgets/custom_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  final int? initialIndex;

  const MainScreen({Key? key, this.initialIndex}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
  }

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
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}