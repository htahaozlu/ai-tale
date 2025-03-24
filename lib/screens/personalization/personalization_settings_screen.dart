import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../theme/app_theme.dart';

class PersonalizationSettingsScreen extends StatelessWidget {
  const PersonalizationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalization'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Reset Settings'),
                  content: const Text('All settings will be reset to default values. Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<ThemeProvider>().resetToDefaults();
                        Navigator.pop(context);
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              );
            },
            tooltip: 'Reset Settings',
          ),
        ],
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildSection(
                title: 'Theme',
                children: [
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    secondary: Icon(
                      themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    ),
                    value: themeProvider.isDarkMode,
                    onChanged: (value) => themeProvider.toggleDarkMode(),
                  ),
                  SwitchListTile(
                    title: const Text('High Contrast Mode'),
                    secondary: const Icon(Icons.contrast),
                    value: themeProvider.isHighContrastMode,
                    onChanged: (value) => themeProvider.toggleHighContrastMode(),
                  ),
                ],
              ),
              _buildSection(
                title: 'Font Size',
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Slider(
                          value: themeProvider.fontSize,
                          min: AppTheme.smallFontSize,
                          max: AppTheme.largeFontSize,
                          divisions: 2,
                          label: _getFontSizeLabel(themeProvider.fontSize),
                          onChanged: (value) => themeProvider.setFontSize(value),
                        ),
                        Text(
                          'Sample Text',
                          style: TextStyle(fontSize: themeProvider.fontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Color Theme',
                children: [
                  _buildColorThemeOption(
                    context,
                    themeProvider,
                    'default',
                    'Default',
                    Colors.blue,
                  ),
                  _buildColorThemeOption(
                    context,
                    themeProvider,
                    'magical_forest',
                    'Magical Forest',
                    Colors.green[700]!,
                  ),
                  _buildColorThemeOption(
                    context,
                    themeProvider,
                    'ocean_blue',
                    'Ocean Blue',
                    Colors.blue[700]!,
                  ),
                  _buildColorThemeOption(
                    context,
                    themeProvider,
                    'royal_purple',
                    'Royal Purple',
                    Colors.purple[700]!,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildColorThemeOption(
      BuildContext context,
      ThemeProvider themeProvider,
      String value,
      String label,
      Color color,
      ) {
    return RadioListTile<String>(
      title: Text(label),
      secondary: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      value: value,
      groupValue: themeProvider.colorTheme,
      onChanged: (newValue) {
        if (newValue != null) {
          themeProvider.setColorTheme(newValue);
        }
      },
    );
  }

  String _getFontSizeLabel(double fontSize) {
    if (fontSize <= AppTheme.smallFontSize) return 'Small';
    if (fontSize >= AppTheme.largeFontSize) return 'Large';
    return 'Medium';
  }
}