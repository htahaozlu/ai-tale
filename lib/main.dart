import 'package:ai_tale/screens/personalization/character_selection_screen.dart';
import 'package:ai_tale/screens/personalization/theme_selection_screen.dart';
import 'package:ai_tale/screens/welcome_screen.dart';
import 'package:ai_tale/screens/write_tale_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ai_tale/providers/auth_provider.dart';
import 'package:ai_tale/screens/auth/sign_in_screen.dart';
import 'package:ai_tale/screens/auth/sign_up_screen.dart';
import 'package:ai_tale/screens/onboarding_screen.dart';
import 'package:ai_tale/screens/personalization/personalization_settings_screen.dart';
import 'constants/colors.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        AppColors.setTheme(themeProvider.isDarkMode);
        return MaterialApp(
          title: 'AI Tale',
          theme: AppTheme.lightTheme(
            themeProvider.colorTheme,
            themeProvider.fontSize,
            themeProvider.isHighContrastMode,
          ),
          darkTheme: AppTheme.darkTheme(
            themeProvider.colorTheme,
            themeProvider.fontSize,
            themeProvider.isHighContrastMode,
          ),
          themeMode:
          themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: '/onboarding',
          routes: {
            '/onboarding': (context) => const OnboardingScreen(),
            '/': (context) => const SignInScreen(),
            '/sign-up': (context) => const SignUpScreen(),
            '/welcome': (context) => const WelcomeScreen(),
            '/main': (context) => MainScreen(
              initialIndex: ModalRoute.of(context)?.settings.arguments as int?,
            ),
            '/personalization': (context) => const PersonalizationSettingsScreen(),
            '/character-selection': (context) =>
            const CharacterSelectionScreen(),
            '/theme-selection': (context) => const ThemeSelectionScreen(),
            '/write-tale': (context) => const WriteTaleScreen(),
          },
        );
      },
    );
  }
}