import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'pixel_box.dart';
import 'section_title.dart';

class ExperienceSection extends StatelessWidget {
  final String lang;
  const ExperienceSection({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      _Exp(
        '2022 - Present',
        lang == 'ko' ? '시니어 모바일 개발자' : 'SENIOR MOBILE DEV',
        lang == 'ko' ? 'ABC 테크' : 'ABC TECH',
        lang == 'ko'
            ? 'Flutter 기반 핀테크 앱 개발 리드. 팀 5명 관리, 아키텍처 설계.'
            : 'Led Flutter-based fintech app development. Managed team of 5.',
      ),
      _Exp(
        '2021 - 2022',
        lang == 'ko' ? '모바일 개발자' : 'MOBILE DEVELOPER',
        lang == 'ko' ? 'XYZ 스타트업' : 'XYZ STARTUP',
        lang == 'ko'
            ? 'Android 네이티브 앱 개발. Kotlin, MVVM 패턴 적용.'
            : 'Android native app development. Kotlin, MVVM pattern.',
      ),
      _Exp(
        '2020 - 2021',
        lang == 'ko' ? '주니어 개발자' : 'JUNIOR DEVELOPER',
        lang == 'ko' ? '프리랜서' : 'FREELANCE',
        lang == 'ko'
            ? '다양한 모바일 프로젝트 참여. 기초 역량 강화.'
            : 'Various mobile projects. Built foundational skills.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: lang == 'ko' ? '경력' : 'EXPERIENCE',
          color: AppColors.accent,
        ),
        const SizedBox(height: 20),
        ...experiences.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PixelBox(
                borderColor: AppColors.border,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        color: AppColors.primary.withValues(alpha: 0.15),
                        child: Text(
                          e.period,
                          style: const TextStyle(fontSize: 14, color: AppColors.primary),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              e.company,
                              style: const TextStyle(fontSize: 18, color: AppColors.accent),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              e.desc,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class _Exp {
  final String period, title, company, desc;
  _Exp(this.period, this.title, this.company, this.desc);
}
