import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF311B45),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconNavItem(Icons.home_outlined, "Home", 0),
          _buildImageNavItem("assets/images/history.png", "Library", 1),
          _buildImageNavItem("assets/images/profile.png", "Profile", 2),
        ],
      ),
    );
  }

  Widget _buildIconNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),  // Parent'ten gelen fonksiyonu çağırır
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildImageNavItem(String imagePath, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),  // Parent'ten gelen fonksiyonu çağırır
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            color: Colors.white,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
