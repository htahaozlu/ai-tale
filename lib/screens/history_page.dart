import 'package:ai_tale/constants/navigation_bar.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, String>> historyItems = [
    {
      "date": "26 September 2024",
      "title": "I dreamt I was falling off a cliff.",
      "description": "",
    },
    {
      "date": "26 September 2024",
      "title":
          "Dreaming of falling off a cliff often symbolizes feelings of anxiety, insecurity, or a loss of control in your life. This dream may reflect fears of failure, being overwhelmed...",
      "description": "",
    },
    {
      "date": "08.03.2025",
      "title": "The Little Fairy",
      "description": "",
    },
  ];

  int _selectedIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    // Add the pages you want to navigate to (example: HomeScreen, HistoryPage, ProfilePage)
    Container(),  // Placeholder for HomeScreen or other pages
    Container(),  // Placeholder for ProfilePage or other pages
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12021D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("History", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];
                return Card(
                  color: Color(0xFF2C1A47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(
                      item["date"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item["title"]!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.white70),
                      onPressed: () {
                        // Add delete functionality here
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(onItemTapped: _onItemTapped),
    );
  }
}
