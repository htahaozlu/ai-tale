import 'package:flutter/material.dart';
import 'package:ai_tale/screens/personalization/theme_selection_screen.dart';
import 'package:ai_tale/theme/app_theme.dart';

class CharacterSelectionScreen extends StatefulWidget {
  const CharacterSelectionScreen({super.key});

  @override
  State<CharacterSelectionScreen> createState() => _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  int? _selectedCharacterIndex;

  final List<Map<String, dynamic>> _characters = [
    {
      'name': 'Prenses',
      'icon': Icons.face,
      'color': Colors.pink,
    },
    {
      'name': 'Şövalye',
      'icon': Icons.security,
      'color': Colors.blue,
    },
    {
      'name': 'Büyücü',
      'icon': Icons.auto_fix_high,
      'color': Colors.purple,
    },
    {
      'name': 'Kaşif',
      'icon': Icons.explore,
      'color': Colors.green,
    },
  ];

  void _handleCharacterSelection(int index) {
    setState(() {
      _selectedCharacterIndex = index;
    });
  }

  void _navigateToThemeSelection() {
    if (_selectedCharacterIndex != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThemeSelectionScreen(
            character: _characters[_selectedCharacterIndex!],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen bir karakter seçin'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karakterini Seç'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hikayenin Kahramanını Seç',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Masalının ana karakterini seç ve macerana başla',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _characters.length,
                  itemBuilder: (context, index) {
                    final character = _characters[index];
                    final isSelected = _selectedCharacterIndex == index;

                    return GestureDetector(
                      onTap: () => _handleCharacterSelection(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? character['color'].withOpacity(0.2)
                              : AppTheme.surfaceColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? character['color']
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              character['icon'],
                              size: 48,
                              color: character['color'],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              character['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: character['color'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _navigateToThemeSelection,
                child: const Text('Devam Et'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}