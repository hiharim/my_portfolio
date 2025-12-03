import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: 40,
      ),
      child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildTextContent()),
        const SizedBox(width: 60),
        Expanded(child: _buildIdeaVisual()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIdeaVisual(),
        const SizedBox(height: 40),
        _buildTextContent(),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6C63FF).withValues(alpha: 0.15),
                const Color(0xFFFF6B9D).withValues(alpha: 0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lightbulb, color: Color(0xFFFFB800), size: 18),
              SizedBox(width: 8),
              Text(
                'Ideas → Reality',
                style: TextStyle(
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          '안녕하세요,',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF5D6470),
          ),
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D), Color(0xFF00B4D8)],
          ).createShader(bounds),
          child: const Text(
            'Android & Flutter\n개발자입니다',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 50,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                '📱 3년차 모바일 개발자',
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF5D6470),
                ),
                speed: const Duration(milliseconds: 80),
              ),
              TypewriterAnimatedText(
                '🤖 Android Native + Flutter 전문',
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF5D6470),
                ),
                speed: const Duration(milliseconds: 80),
              ),
              TypewriterAnimatedText(
                '💡 아이디어를 앱으로 실현합니다',
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF5D6470),
                ),
                speed: const Duration(milliseconds: 80),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            _buildCTAButton(
              '프로젝트 보기',
              const Color(0xFF6C63FF),
              Icons.rocket_launch,
            ),
            const SizedBox(width: 16),
            _buildOutlineButton('연락하기', Icons.mail_outline),
          ],
        ),
      ],
    );
  }

  Widget _buildCTAButton(String text, Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildOutlineButton(String text, IconData icon) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF2D3142),
        side: const BorderSide(color: Color(0xFFDDE1E6)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildIdeaVisual() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF6C63FF).withValues(alpha: 0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.lightbulb,
              size: 100,
              color: Colors.white,
            ),
          ),
          ..._buildFloatingBubbles(),
        ],
      ),
    );
  }

  List<Widget> _buildFloatingBubbles() {
    final bubbles = [
      (Icons.phone_android, -120.0, -80.0),
      (Icons.code, 100.0, -60.0),
      (Icons.cloud, -80.0, 100.0),
      (Icons.auto_awesome, 120.0, 80.0),
      (Icons.psychology, 0.0, -130.0),
    ];

    return bubbles.map((bubble) {
      return Positioned(
        left: 150 + bubble.$2,
        top: 150 + bubble.$3,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withValues(alpha: 0.15),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(
            bubble.$1,
            color: const Color(0xFF6C63FF),
            size: 24,
          ),
        ),
      );
    }).toList();
  }
}
