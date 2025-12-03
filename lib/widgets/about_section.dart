import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
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
                  colors: [Colors.transparent, Color(0xFF6C63FF)],
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '💭 About Me',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6C63FF),
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
                  colors: [Color(0xFF6C63FF), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '아이디어를 현실로',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildProfileCard()),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildAboutContent()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildProfileCard(),
        const SizedBox(height: 40),
        _buildAboutContent(),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
                  blurRadius: 20,
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '[Your Name]',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '🤖 Android & Flutter Developer',
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildStatRow(),
        ],
      ),
    );
  }

  Widget _buildStatRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStat('3년', '경력'),
        _buildStat('15+', '출시 앱'),
        _buildStat('50+', '아이디어'),
      ],
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
          ).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF8B9099),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '3년차 Android & Flutter 개발자로, 아이디어를 앱으로 실현하는 것을 좋아합니다.',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF2D3142),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Android Native(Kotlin/Java)로 시작해 Flutter로 크로스플랫폼 개발까지 영역을 확장했습니다. '
          'MVVM, Clean Architecture 등 견고한 아키텍처를 기반으로 유지보수가 쉬운 앱을 만들고, '
          '항상 새로운 아이디어를 탐구하며 사용자 경험을 개선하는 데 집중합니다.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF5D6470),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        _buildTraitCards(),
      ],
    );
  }

  Widget _buildTraitCards() {
    final traits = [
      ('💡', '아이디어 뱅크', '매일 새로운 앱 아이디어를 기록하고 발전시킵니다'),
      ('🏗️', '아키텍처 설계', 'MVVM, Clean Architecture로 견고한 앱 구조'),
      ('🔄', '빠른 프로토타이핑', 'Flutter로 아이디어를 빠르게 검증합니다'),
      ('📱', '네이티브 경험', 'Android 플랫폼에 대한 깊은 이해'),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: traits.map((trait) => _buildTraitCard(trait)).toList(),
    );
  }

  Widget _buildTraitCard((String, String, String) trait) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE8ECF2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trait.$1,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Text(
            trait.$2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            trait.$3,
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
