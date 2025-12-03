import 'package:flutter/material.dart';

class IdeasSection extends StatelessWidget {
  const IdeasSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: 80,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFF8F9FC),
            const Color(0xFF6C63FF).withValues(alpha: 0.05),
            const Color(0xFFF8F9FC),
          ],
        ),
      ),
      child: Column(
        children: [
          _buildSectionTitle(),
          const SizedBox(height: 20),
          const Text(
            '항상 새로운 아이디어를 탐구하고 있습니다',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8B9099),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          _buildIdeasShowcase(isDesktop),
          const SizedBox(height: 60),
          _buildIdeaStats(isDesktop),
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
                  colors: [Colors.transparent, Color(0xFFFFB800)],
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '💡 Idea Bank',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFFFB800),
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
                  colors: [Color(0xFFFFB800), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '아이디어 뱅크',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
      ],
    );
  }

  Widget _buildIdeasShowcase(bool isDesktop) {
    final ideas = [
      IdeaItem(
        emoji: '🎮',
        title: '게이미피케이션 습관 앱',
        status: 'In Progress',
        statusColor: const Color(0xFF6BCB77),
      ),
      IdeaItem(
        emoji: '🤖',
        title: 'AI 코드 리뷰 도우미',
        status: 'Planning',
        statusColor: const Color(0xFFFFB800),
      ),
      IdeaItem(
        emoji: '📊',
        title: '개발자 생산성 트래커',
        status: 'Research',
        statusColor: const Color(0xFFFF6B9D),
      ),
      IdeaItem(
        emoji: '🔔',
        title: '스마트 알림 매니저',
        status: 'Idea',
        statusColor: const Color(0xFF6C63FF),
      ),
      IdeaItem(
        emoji: '📱',
        title: 'Flutter 위젯 라이브러리',
        status: 'In Progress',
        statusColor: const Color(0xFF6BCB77),
      ),
      IdeaItem(
        emoji: '🧪',
        title: 'UI 테스트 자동화 도구',
        status: 'Planning',
        statusColor: const Color(0xFFFFB800),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB800).withValues(alpha: 0.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB800).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.lightbulb,
                  color: Color(0xFFFFB800),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '현재 아이디어 목록',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                  Text(
                    '새로운 프로젝트 후보들',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B9099),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: ideas.map((idea) => _buildIdeaCard(idea, isDesktop)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildIdeaCard(IdeaItem idea, bool isDesktop) {
    return Container(
      width: isDesktop ? 280 : double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8ECF2),
        ),
      ),
      child: Row(
        children: [
          Text(
            idea.emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  idea.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: idea.statusColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    idea.status,
                    style: TextStyle(
                      fontSize: 11,
                      color: idea.statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdeaStats(bool isDesktop) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        _buildStatCard('💡', '50+', '총 아이디어'),
        _buildStatCard('🚀', '12', '진행 중'),
        _buildStatCard('✅', '8', '완료'),
        _buildStatCard('📝', '30+', '계획 중'),
      ],
    );
  }

  Widget _buildStatCard(String emoji, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8B9099),
            ),
          ),
        ],
      ),
    );
  }
}

class IdeaItem {
  final String emoji;
  final String title;
  final String status;
  final Color statusColor;

  IdeaItem({
    required this.emoji,
    required this.title,
    required this.status,
    required this.statusColor,
  });
}
