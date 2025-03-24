import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Size: ${themeProvider.fontSize.toStringAsFixed(1)}',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withAlpha(25),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _getFontSizeLabel(themeProvider.fontSize),
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: AppColors.primary,
                            inactiveTrackColor: AppColors.primary.withAlpha(51),
                            thumbColor: AppColors.primary,
                            overlayColor: AppColors.primary.withAlpha(51),
                          ),
                          child: Slider(
                            value: themeProvider.fontSize,
                            min: AppTheme.smallFontSize,
                            max: AppTheme.largeFontSize,
                            divisions: 2,
                            onChanged: (value) => themeProvider.setFontSize(value),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Sample Text',
                          style: TextStyle(
                            fontSize: themeProvider.fontSize,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Text Density',
                children: [
                  ListTile(
                    title: Text(
                      'Line Spacing',
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                    subtitle: Text(
                      'Adjust the space between lines of text',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    trailing: DropdownButton<double>(
                      value: themeProvider.lineHeight ?? 1.2,
                      items: [
                        DropdownMenuItem(
                          value: 1.0,
                          child: Text('Compact', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                        DropdownMenuItem(
                          value: 1.2,
                          child: Text('Normal', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                        DropdownMenuItem(
                          value: 1.5,
                          child: Text('Relaxed', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                      ],
                      onChanged: (value) => themeProvider.setLineHeight(value ?? 1.2),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Letter Spacing',
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                    subtitle: Text(
                      'Adjust the space between characters',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    trailing: DropdownButton<double>(
                      value: themeProvider.letterSpacing ?? 0.0,
                      items: [
                        DropdownMenuItem(
                          value: -0.5,
                          child: Text('Tight', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                        DropdownMenuItem(
                          value: 0.0,
                          child: Text('Normal', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                        DropdownMenuItem(
                          value: 0.5,
                          child: Text('Loose', style: TextStyle(color: AppColors.textPrimary)),
                        ),
                      ],
                      onChanged: (value) => themeProvider.setLetterSpacing(value ?? 0.0),
                    ),
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