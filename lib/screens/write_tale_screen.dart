import 'package:ai_tale/constants/navigation_bar.dart';
import 'package:flutter/material.dart';

class WriteTaleScreen extends StatefulWidget {
  const WriteTaleScreen({super.key});

  @override
  State<WriteTaleScreen> createState() => _WriteTaleScreenState();
}

class _WriteTaleScreenState extends State<WriteTaleScreen> {
  final TextEditingController _taleController = TextEditingController();
  int maxLength = 1000;

  // Define the function to handle bottom navigation item taps
  void _onItemTapped(int index) {
    // Implement your navigation logic here
    print("Selected bottom navigation index: $index");
  }

  @override
  void dispose() {
    _taleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                      'Write Your Tale',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 40), 
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Text Input Area
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            TextField(
                              controller: _taleController,
                              maxLength: maxLength,
                              maxLines: 10,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Start writing your tale...',
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                                counterStyle: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Ad Section
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D3142),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Add Section',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Start Journey Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/story-page');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C63FF),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Start Journey',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(onItemTapped: _onItemTapped), // Pass the _onItemTapped function here
    );
  }
}
