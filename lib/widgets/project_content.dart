import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/widgets/pixel_card.dart';

class ProjectsContent extends StatelessWidget {
  const ProjectsContent({super.key});

  // 프로젝트 데이터 - 여기에 추가하면 자동으로 표시됨
  static const projects = [
    _Project(
      icon: '🥊',
      title: 'Shadow Boxing UGC App',
      type: '개인 프로젝트',
      stack: 'Flutter Web · Riverpod',
      period: '2024.11 ~ 진행중',
      description: '쉐도우복싱 콤비네이션을 블록처럼 조합하고 타임라인으로 재생하는 연습 웹앱',
      features: ['콤비 에디터', '타임라인 재생', '로컬 저장', '반복 모드'],
      links: [
        _Link(label: 'Demo', url: 'https://your-demo.com'),
        _Link(label: 'GitHub', url: 'https://github.com/your-repo'),
      ],
    ),
    _Project(
      icon: '🛒',
      title: 'NFT Gift Card Commerce',
      type: '회사 프로젝트',
      stack: 'Flutter · Android · Firebase',
      period: '2023.01 ~ 현재',
      description: 'NFT 기반 기프트카드 커머스 플랫폼 (MAU 5만+)',
      features: ['상품 리스트', '결제 시스템', '쿠폰/기프트카드', '푸시 알림'],
      links: [],
    ),
    _Project(
      icon: '📱',
      title: 'Todo App with Clean Architecture',
      type: '학습 프로젝트',
      stack: 'Flutter · Bloc · SQLite',
      period: '2023.06',
      description: 'Clean Architecture 패턴을 학습하기 위한 Todo 앱',
      features: ['CRUD 기능', 'Local DB', 'Unit Test', 'Widget Test'],
      links: [
        _Link(label: 'GitHub', url: 'https://github.com/your-repo'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: projects
          .map((project) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ProjectCard(project: project),
              ))
          .toList(),
    );
  }
}

class _Project {
  final String icon;
  final String title;
  final String type;
  final String stack;
  final String period;
  final String description;
  final List<String> features;
  final List<_Link> links;

  const _Project({
    required this.icon,
    required this.title,
    required this.type,
    required this.stack,
    required this.period,
    required this.description,
    required this.features,
    required this.links,
  });
}

class _Link {
  final String label;
  final String url;

  const _Link({
    required this.label,
    required this.url,
  });
}

class _ProjectCard extends StatefulWidget {
  final _Project project;

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
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(
          _isHovered ? -2 : 0,
          _isHovered ? -2 : 0,
          0,
        ),
        child: PixelCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로젝트 헤더
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.icon,
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.lineDark,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.accent,
                                border: Border.all(color: AppColors.lineDark, width: 1),
                              ),
                              child: Text(
                                widget.project.type.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '📅 ${widget.project.period}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSub,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // 설명
              Text(
                widget.project.description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 12),
              // 기술 스택
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(color: AppColors.lineDark, width: 1),
                ),
                child: Row(
                  children: [
                    const Text(
                      '🛠️',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.project.stack,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // 주요 기능
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.features
                    .map((feature) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            border: Border.all(color: AppColors.lineDark, width: 1),
                          ),
                          child: Text(
                            feature,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textMain,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              // 링크
              if (widget.project.links.isNotEmpty) ...[
                const SizedBox(height: 12),
                Row(
                  children: widget.project.links
                      .map((link) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: _LinkButton(link: link),
                          ))
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final _Link link;

  const _LinkButton({required this.link});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // TODO: url_launcher로 링크 열기
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: AppColors.lineDark, width: 2),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lineDark,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            link.label.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
