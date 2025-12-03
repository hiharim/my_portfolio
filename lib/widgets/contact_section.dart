import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'pixel_box.dart';
import 'section_title.dart';
import 'pixel_button.dart';

class ContactSection extends StatelessWidget {
  final String lang;
  const ContactSection({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: lang == 'ko' ? '연락하기' : 'CONTACT',
          color: AppColors.accent,
        ),
        const SizedBox(height: 20),
        PixelBox(
          borderColor: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow('📧', 'EMAIL', 'dev@example.com'),
                const SizedBox(height: 16),
                _buildRow(
                  '📍',
                  lang == 'ko' ? '위치' : 'LOCATION',
                  lang == 'ko' ? '서울, 한국' : 'SEOUL, KOREA',
                ),
                const SizedBox(height: 16),
                _buildRow('🔗', 'GITHUB', 'github.com/username'),
                const SizedBox(height: 24),
                PixelButton(
                  text: lang == 'ko' ? '메시지 보내기 ▶' : 'SEND MESSAGE ▶',
                  color: AppColors.primary,
                  fontSize: 20,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            '© 2024 PORTFOLIO',
            style: const TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String emoji, String label, String value) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
