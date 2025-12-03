import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'pixel_box.dart';
import 'pixel_character.dart';
import 'pixel_button.dart';

class HeroSection extends StatelessWidget {
  final String lang;
  const HeroSection({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return PixelBox(
      borderColor: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAbout(),
                  const SizedBox(width: 32),
                  Expanded(child: _buildContent()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: _buildAbout()),
                  const SizedBox(height: 24),
                  _buildContent(),
                ],
              ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lang == 'ko' ? 'ANDROID & FLUTTER\n개발자' : 'ANDROID & FLUTTER\nDEVELOPER',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          lang == 'ko' ? '3년차 · 아이디어를 앱으로' : '3 YRS EXP · IDEAS TO APPS',
          style: const TextStyle(fontSize: 20, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            PixelButton(
              text: lang == 'ko' ? '프로젝트' : 'PROJECTS',
              color: AppColors.primary,
              onPressed: () {},
            ),
            PixelButton(
              text: lang == 'ko' ? '연락' : 'CONTACT',
              color: AppColors.accent,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAbout() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border, width: 3),
      ),
      child: Column(
        children: [
          const PixelCharacter(),
          const SizedBox(height: 12),
          const Text(
            '[NAME]',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            color: AppColors.accent.withValues(alpha: 0.2),
            child: Text(
              'LV.3',
              style: const TextStyle(fontSize: 14, color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}
