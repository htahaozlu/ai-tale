import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  double _fontSize = 16.0;
  String _colorTheme = 'default';
  bool _isHighContrastMode = false;
  double _lineHeight = 1.2;
  double _letterSpacing = 0.0;

  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;
  String get colorTheme => _colorTheme;
  bool get isHighContrastMode => _isHighContrastMode;
  double get lineHeight => _lineHeight;
  double get letterSpacing => _letterSpacing;

  static const String DARK_MODE_KEY = 'dark_mode';
  static const String FONT_SIZE_KEY = 'font_size';
  static const String COLOR_THEME_KEY = 'color_theme';
  static const String HIGH_CONTRAST_KEY = 'high_contrast';
  static const String LINE_HEIGHT_KEY = 'line_height';
  static const String LETTER_SPACING_KEY = 'letter_spacing';

  ThemeProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(DARK_MODE_KEY) ?? false;
    _fontSize = prefs.getDouble(FONT_SIZE_KEY) ?? 16.0;
    _colorTheme = prefs.getString(COLOR_THEME_KEY) ?? 'default';
    _isHighContrastMode = prefs.getBool(HIGH_CONTRAST_KEY) ?? false;
    _lineHeight = prefs.getDouble(LINE_HEIGHT_KEY) ?? 1.2;
    _letterSpacing = prefs.getDouble(LETTER_SPACING_KEY) ?? 0.0;
    AppColors.setTheme(_isDarkMode);
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    AppColors.setTheme(_isDarkMode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(DARK_MODE_KEY, _isDarkMode);
    notifyListeners();
  }

  Future<void> setFontSize(double size) async {
    _fontSize = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(FONT_SIZE_KEY, size);
    notifyListeners();
  }

  Future<void> setColorTheme(String theme) async {
    _colorTheme = theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(COLOR_THEME_KEY, theme);
    notifyListeners();
  }

  Future<void> toggleHighContrastMode() async {
    _isHighContrastMode = !_isHighContrastMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(HIGH_CONTRAST_KEY, _isHighContrastMode);
    notifyListeners();
  }

  Future<void> setLineHeight(double height) async {
    _lineHeight = height;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(LINE_HEIGHT_KEY, height);
    notifyListeners();
  }

  Future<void> setLetterSpacing(double spacing) async {
    _letterSpacing = spacing;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(LETTER_SPACING_KEY, spacing);
    notifyListeners();
  }

  Future<void> resetToDefaults() async {
    _isDarkMode = false;
    _fontSize = 16.0;
    _colorTheme = 'default';
    _isHighContrastMode = false;
    _lineHeight = 1.2;
    _letterSpacing = 0.0;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }
}