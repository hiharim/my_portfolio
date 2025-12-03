import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'section_title.dart';

class SkillsSection extends StatelessWidget {
  final String lang;
  const SkillsSection({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: lang == 'ko' ? '기술 스택' : 'SKILLS',
          color: AppColors.textPrimary,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildChip('ANDROID', AppColors.accent),
            _buildChip('KOTLIN', AppColors.accent),
            _buildChip('FLUTTER', AppColors.primary),
            _buildChip('DART', AppColors.primary),
            _buildChip('MVVM', AppColors.textSecondary),
            _buildChip('CLEAN ARCH', AppColors.textSecondary),
            _buildChip('FIREBASE', AppColors.textSecondary),
            _buildChip('GIT', AppColors.textSecondary),
            _buildChip('BLOC', AppColors.primary),
            _buildChip('RIVERPOD', AppColors.primary),
            _buildChip('HILT', AppColors.accent),
            _buildChip('COROUTINES', AppColors.accent),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
