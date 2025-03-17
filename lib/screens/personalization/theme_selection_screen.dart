import 'package:flutter/material.dart';
import 'package:ai_tale/theme/app_theme.dart';

class ThemeSelectionScreen extends StatefulWidget {
  final Map<String, dynamic> character;

  const ThemeSelectionScreen({
    super.key,
    required this.character,
  });

  @override
  State<ThemeSelectionScreen> createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  int? _selectedThemeIndex;

  final List<Map<String, dynamic>> _themes = [
    {
      'name': 'Sihirli Orman',
      'description': 'Gizemli ağaçlar ve büyülü yaratıklar',
      'icon': Icons.forest,
      'color': Colors.green,
    },
    {
      'name': 'Uzay Macerası',
      'description': 'Yıldızlar arası bir yolculuk',
      'icon': Icons.rocket,
      'color': Colors.purple,
    },
    {
      'name': 'Orta Çağ Kalesi',
      'description': 'Şövalyeler ve ejderhalar diyarı',
      'icon': Icons.castle,
      'color': Colors.brown,
    },
    {
      'name': 'Deniz Altı',
      'description': 'Okyanus derinliklerinde bir macera',
      'icon': Icons.water,
      'color': Colors.blue,
    },
    {
      'name': 'Periler Diyarı',
      'description': 'Işıltılı ve renkli bir dünya',
      'icon': Icons.auto_fix_high,
      'color': Colors.pink,
    },
    {
      'name': 'Dinozor Adası',
      'description': 'Tarih öncesi bir macera',
      'icon': Icons.pets,
      'color': Colors.orange,
    },
  ];

  void _handleThemeSelection(int index) {
    setState(() {
      _selectedThemeIndex = index;
    });
  }

  void _startStoryGeneration() {
    if (_selectedThemeIndex != null) {
      // TODO: Navigate to story generation screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Hikaye oluşturuluyor...'),
          backgroundColor: AppTheme.primaryColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen bir tema seçin'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema Seç'),
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
                'Hikayenin Temasını Seç',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.character['name']} karakterin için bir tema seç',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: _themes.length,
                  itemBuilder: (context, index) {
                    final theme = _themes[index];
                    final isSelected = _selectedThemeIndex == index;

                    return GestureDetector(
                      onTap: () => _handleThemeSelection(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme['color'].withOpacity(0.2)
                              : AppTheme.surfaceColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? theme['color']
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              theme['icon'],
                              size: 48,
                              color: theme['color'],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              theme['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                color: theme['color'],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                theme['description'],
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                onPressed: _startStoryGeneration,
                child: const Text('Hikayeyi Başlat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}