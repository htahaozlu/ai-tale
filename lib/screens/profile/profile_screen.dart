import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Profile',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: themeProvider.fontSize * 1.5,
                  height: themeProvider.lineHeight,
                  letterSpacing: themeProvider.letterSpacing,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const _ProfileHeader(),
                  const SizedBox(height: 24),
                  _buildSection(
                    context,
                    'Settings',
                    [
                      _buildListTile(
                        context,
                        'Personalization',
                        Icons.palette_outlined,
                            () => Navigator.pushNamed(
                          context,
                          '/personalization',
                        ),
                      ),
                      _buildListTile(
                        context,
                        'Notifications',
                        Icons.notifications_outlined,
                            () {},
                      ),
                      _buildListTile(
                        context,
                        'Privacy',
                        Icons.lock_outline,
                            () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    context,
                    'Account',
                    [
                      _buildListTile(
                        context,
                        'Edit Profile',
                        Icons.edit_outlined,
                            () {},
                      ),
                      _buildListTile(
                        context,
                        'Change Password',
                        Icons.key_outlined,
                            () {},
                      ),
                      _buildListTile(
                        context,
                        'Sign Out',
                        Icons.logout_outlined,
                            () => context.read<AuthProvider>().signOut(),
                        isDestructive: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context,
      String title,
      List<Widget> children,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Card(
          color: AppColors.cardBackground,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(
      BuildContext context,
      String title,
      IconData icon,
      VoidCallback onTap, {
        bool isDestructive = false,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : AppColors.textPrimary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isDestructive ? Colors.red : AppColors.textPrimary,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.textSecondary,
      ),
      onTap: onTap,
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/backgrounds/profile.jpg'),
        ),
        const SizedBox(height: 16),
        Text(
          'John Doe',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'john.doe@example.com',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStat(context, '23', 'Stories'),
            _buildStat(context, '58', 'Favorites'),
            _buildStat(context, '1.5h', 'Listening'),
          ],
        ),
      ],
    );
  }

  Widget _buildStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}