import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: 80,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F9FC),
      ),
      child: Column(
        children: [
          _buildSectionTitle(),
          const SizedBox(height: 60),
          _buildSkillsGrid(isDesktop),
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Color(0xFFFF6B9D)],
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '🛠️ Skills',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFFF6B9D),
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 40,
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF6B9D), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '기술 스택',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(bool isDesktop) {
    final skillCategories = [
      SkillCategory(
        icon: Icons.android,
        title: 'Android Native',
        color: const Color(0xFF3DDC84),
        skills: ['Kotlin', 'Java', 'Jetpack Compose', 'XML Layout', 'Coroutines'],
      ),
      SkillCategory(
        icon: Icons.flutter_dash,
        title: 'Flutter',
        color: const Color(0xFF02569B),
        skills: ['Dart', 'Bloc/Riverpod', 'GetX', 'Provider', 'Widget Testing'],
      ),
      SkillCategory(
        icon: Icons.architecture,
        title: 'Architecture',
        color: const Color(0xFFFF6B9D),
        skills: ['MVVM', 'Clean Architecture', 'Repository Pattern', 'DI (Hilt/Koin)'],
      ),
      SkillCategory(
        icon: Icons.storage,
        title: 'Backend & Database',
        color: const Color(0xFF00B4D8),
        skills: ['Firebase', 'Room', 'SQLite', 'REST API', 'GraphQL'],
      ),
      SkillCategory(
        icon: Icons.build,
        title: 'DevOps & Tools',
        color: const Color(0xFFFFB800),
        skills: ['Git', 'GitHub Actions', 'Fastlane', 'Play Console', 'Crashlytics'],
      ),
      SkillCategory(
        icon: Icons.extension,
        title: 'Libraries',
        color: const Color(0xFF6C63FF),
        skills: ['Retrofit', 'OkHttp', 'Glide/Coil', 'Navigation', 'WorkManager'],
      ),
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: skillCategories.map((category) {
        return _buildSkillCard(category, isDesktop);
      }).toList(),
    );
  }

  Widget _buildSkillCard(SkillCategory category, bool isDesktop) {
    return Container(
      width: isDesktop ? 280 : double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: category.color.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: category.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              category.icon,
              color: category.color,
              size: 28,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            category.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 16),
          ...category.skills.map((skill) => _buildSkillItem(skill, category.color)),
        ],
      ),
    );
  }

  Widget _buildSkillItem(String skill, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            skill,
            style: const TextStyle(
              color: Color(0xFF5D6470),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCategory {
  final IconData icon;
  final String title;
  final Color color;
  final List<String> skills;

  SkillCategory({
    required this.icon,
    required this.title,
    required this.color,
    required this.skills,
  });
}
