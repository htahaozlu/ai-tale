import 'package:ai_tale/constants/colors.dart';
import 'package:ai_tale/constants/navigation_bar.dart';
import 'package:flutter/material.dart';

class SuggestedStories extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "title": "Fallen Star",
      "image": "assets/images/blog1.jpg", 
      "description":
          "High above the world, a star had fallen, leaving a trail of sparkling dust behind. It traveled across the sky, searching for its way home. As it journeyed, it brought a sense of wonder and hope to everyone who caught a glimpse of its glowing path."
    },
    {
      "title": "Fairy",
      "image": "assets/images/blog2.jpg",
      "description":
          "High above the world, a star had fallen, leaving a trail of sparkling dust behind. It traveled across the sky, searching for its way home. As it journeyed, it brought a sense of wonder and hope to everyone who caught a glimpse of its glowing path."
    },
    {
      "title": "Fairy",
      "image": "assets/images/blog2.jpg",
      "description":
          "High above the world, a star had fallen, leaving a trail of sparkling dust behind. It traveled across the sky, searching for its way home. As it journeyed, it brought a sense of wonder and hope to everyone who caught a glimpse of its glowing path."
    },
  ];

  // Callback function to handle bottom navigation
  void _onItemTapped(int index) {
    // Add your navigation logic here, like updating a page or index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Text("You may like", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 19.0),
              child: Card(
                color: Color(0xFF0D0118),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item["image"]!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item["description"]!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
       bottomNavigationBar: CustomBottomNavBar(onItemTapped: _onItemTapped), // Pass the callback here
    );
  }
}
