import 'package:flutter/material.dart';

import '../constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 156),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLight.withAlpha(100),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}