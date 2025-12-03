import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildSectionTitle(),
          const SizedBox(height: 60),
          _buildProjectsGrid(isDesktop),
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
                  colors: [Colors.transparent, Color(0xFF00B4D8)],
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '🚀 Projects',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF00B4D8),
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
                  colors: [Color(0xFF00B4D8), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '프로젝트',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(bool isDesktop) {
    final projects = [
      Project(
        title: '커머스 앱 (Android)',
        description: 'MAU 50만+ 쇼핑 앱. Kotlin, MVVM, Coroutines 기반. 결제/배송 추적 기능.',
        tags: ['Kotlin', 'MVVM', 'Hilt', 'Coroutines'],
        color: const Color(0xFF3DDC84),
        icon: Icons.shopping_bag_outlined,
      ),
      Project(
        title: '핀테크 앱 (Flutter)',
        description: '간편 송금 및 자산관리 앱. Clean Architecture, 생체인증, 보안 강화.',
        tags: ['Flutter', 'Bloc', 'Clean Arch', 'Firebase'],
        color: const Color(0xFF02569B),
        icon: Icons.account_balance_wallet_outlined,
      ),
      Project(
        title: '헬스케어 트래커',
        description: '운동, 식단, 수면 종합 관리. Google Fit 연동, 차트 시각화.',
        tags: ['Flutter', 'Health Connect', 'Charts'],
        color: const Color(0xFFFF6B9D),
        icon: Icons.favorite_outline,
      ),
      Project(
        title: '실시간 채팅 앱',
        description: 'WebSocket 기반 1:1/그룹 채팅. 푸시 알림, 미디어 공유 지원.',
        tags: ['Kotlin', 'WebSocket', 'FCM', 'Room'],
        color: const Color(0xFF00B4D8),
        icon: Icons.chat_bubble_outline,
      ),
      Project(
        title: '아이디어 노트',
        description: '떠오르는 아이디어를 빠르게 기록. 태그 분류, 클라우드 동기화.',
        tags: ['Flutter', 'Riverpod', 'Firebase'],
        color: const Color(0xFFFFB800),
        icon: Icons.lightbulb_outline,
      ),
      Project(
        title: '위치 기반 서비스',
        description: '주변 맛집/카페 추천 앱. Google Maps, 리뷰 시스템.',
        tags: ['Kotlin', 'Maps SDK', 'Retrofit'],
        color: const Color(0xFF6BCB77),
        icon: Icons.location_on_outlined,
      ),
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: projects.map((project) {
        return _buildProjectCard(project, isDesktop);
      }).toList(),
    );
  }

  Widget _buildProjectCard(Project project, bool isDesktop) {
    return Container(
      width: isDesktop ? 380 : double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: project.color.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  project.color.withValues(alpha: 0.15),
                  project.color.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    project.icon,
                    size: 80,
                    color: project.color.withValues(alpha: 0.5),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.open_in_new,
                      color: project.color,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF5D6470),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: project.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 12,
                          color: project.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final Color color;
  final IconData icon;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.color,
    required this.icon,
  });
}
