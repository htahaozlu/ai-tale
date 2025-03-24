import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Library',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                tabs: const [
                  Tab(text: 'My Stories'),
                  Tab(text: 'Favorites'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildStoriesList(context),
                    _buildStoriesList(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoriesList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          color: AppColors.cardBackground,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/story_${(index % 3) + 1}.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              'Story ${index + 1}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: Text(
              'Last read: 2 days ago',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: AppColors.primary,
              ),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}