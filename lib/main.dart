import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ai_tale/providers/auth_provider.dart';
import 'package:ai_tale/screens/auth/sign_in_screen.dart';
import 'package:ai_tale/screens/welcome_screen.dart';
import 'package:ai_tale/screens/home_screen.dart';
import 'package:ai_tale/screens/personalization/character_selection_screen.dart';
import 'package:ai_tale/screens/personalization/theme_selection_screen.dart';
import 'package:ai_tale/screens/write_tale_screen.dart';
import 'package:ai_tale/screens/onboarding_screen.dart';
import 'package:ai_tale/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'AI-Tale',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (context) => const OnboardingScreen(),
          '/': (context) => const SignInScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/home': (context) => const HomeScreen(),
          '/character-selection': (context) => const CharacterSelectionScreen(),
          '/theme-selection': (context) => const ThemeSelectionScreen(),
          '/write-tale': (context) => const WriteTaleScreen(),
        },
      ),
    );
  }
}