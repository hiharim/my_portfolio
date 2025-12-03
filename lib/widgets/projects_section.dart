import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'pixel_box.dart';
import 'section_title.dart';

class ProjectsSection extends StatelessWidget {
  final String lang;
  const ProjectsSection({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    final projects = [
      _P(
        lang == 'ko' ? '커머스 앱' : 'COMMERCE APP',
        lang == 'ko'
            ? 'MAU 50만+ 대형 쇼핑 플랫폼. 상품 검색, 장바구니, 결제, 배송 추적 기능 구현.'
            : '500K+ MAU shopping platform. Product search, cart, payment, delivery tracking.',
        ['Kotlin', 'MVVM', 'Hilt', 'Coroutines'],
        '🛒',
        AppColors.accent,
      ),
      _P(
        lang == 'ko' ? '핀테크 앱' : 'FINTECH APP',
        lang == 'ko'
            ? '간편 송금 및 자산관리 앱. 생체인증, 보안 강화, 실시간 잔액 조회.'
            : 'Easy transfer & asset management. Biometric auth, enhanced security.',
        ['Flutter', 'Bloc', 'Clean Arch', 'Firebase'],
        '💰',
        AppColors.primary,
      ),
      _P(
        lang == 'ko' ? '헬스케어 앱' : 'HEALTH APP',
        lang == 'ko'
            ? '운동, 식단, 수면 종합 관리. Google Fit 연동, 차트 시각화.'
            : 'Fitness, diet, sleep tracker. Google Fit integration, chart visualization.',
        ['Flutter', 'Riverpod', 'Health Connect'],
        '❤️',
        AppColors.purple,
      ),
      _P(
        lang == 'ko' ? '실시간 채팅 앱' : 'CHAT APP',
        lang == 'ko'
            ? 'WebSocket 기반 1:1/그룹 채팅. 푸시 알림, 미디어 공유, 읽음 표시.'
            : 'WebSocket-based 1:1/group chat. Push notifications, media sharing.',
        ['Kotlin', 'WebSocket', 'FCM', 'Room'],
        '💬',
        AppColors.primary,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: lang == 'ko' ? '프로젝트' : 'PROJECTS',
          color: AppColors.primary,
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 900 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: crossAxisCount == 2 ? 1.3 : 1.5,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) => _ProjectCard(project: projects[index]),
            );
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final _P project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.translationValues(
          _isHovered ? -2 : 0,
          _isHovered ? -2 : 0,
          0,
        ),
        child: PixelBox(
          borderColor: _isHovered ? widget.project.color : AppColors.border,
          child: Container(
            decoration: _isHovered
                ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: widget.project.color.withValues(alpha: 0.2),
                        offset: const Offset(4, 4),
                      ),
                    ],
                  )
                : null,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(widget.project.emoji, style: const TextStyle(fontSize: 32)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.project.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: widget.project.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.project.desc,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.tags
                        .map((t) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: widget.project.color.withValues(alpha: 0.1),
                                border: Border.all(color: widget.project.color, width: 2),
                              ),
                              child: Text(
                                t,
                                style: TextStyle(fontSize: 14, color: widget.project.color),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _P {
  final String title, desc, emoji;
  final List<String> tags;
  final Color color;
  _P(this.title, this.desc, this.tags, this.emoji, this.color);
}
