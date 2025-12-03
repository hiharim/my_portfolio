import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          const SizedBox(height: 80),
          _buildFooter(),
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
                  colors: [Colors.transparent, Color(0xFF6BCB77)],
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              '📬 Contact',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6BCB77),
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
                  colors: [Color(0xFF6BCB77), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '함께 만들어요',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '새로운 아이디어가 있으신가요? 함께 이야기해요!',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF8B9099),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo()),
        const SizedBox(width: 60),
        Expanded(child: _buildContactForm()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactInfo(),
        const SizedBox(height: 40),
        _buildContactForm(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '연락처 정보',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          Icons.email_outlined,
          'Email',
          'your.email@example.com',
          const Color(0xFF6C63FF),
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          Icons.location_on_outlined,
          'Location',
          'Seoul, South Korea',
          const Color(0xFFFF6B9D),
        ),
        const SizedBox(height: 32),
        const Text(
          '소셜 미디어',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialButton(FontAwesomeIcons.github, 'https://github.com'),
            const SizedBox(width: 12),
            _buildSocialButton(FontAwesomeIcons.linkedin, 'https://linkedin.com'),
            const SizedBox(width: 12),
            _buildSocialButton(FontAwesomeIcons.twitter, 'https://twitter.com'),
            const SizedBox(width: 12),
            _buildSocialButton(FontAwesomeIcons.instagram, 'https://instagram.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value, Color color) {
    return Container(
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8B9099),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2D3142),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE8ECF2),
          ),
        ),
        child: FaIcon(
          icon,
          color: const Color(0xFF5D6470),
          size: 20,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFE8ECF2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '메시지 보내기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField('이름', Icons.person_outline),
          const SizedBox(height: 16),
          _buildTextField('이메일', Icons.email_outlined),
          const SizedBox(height: 16),
          _buildTextField('메시지', Icons.message_outlined, maxLines: 4),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
                ),
                borderRadius: BorderRadius.circular(12),
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
                icon: const Icon(Icons.send, size: 20),
                label: const Text('보내기'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Color(0xFF2D3142)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF8B9099)),
        prefixIcon: Icon(icon, color: const Color(0xFF8B9099)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE8ECF2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE8ECF2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF6C63FF)),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                const Color(0xFF6C63FF).withValues(alpha: 0.3),
                Colors.transparent,
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.lightbulb_outline, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 12),
            const Text(
              'IdeaBank Portfolio',
              style: TextStyle(
                color: Color(0xFF5D6470),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          '© 2024 All Rights Reserved. Made with 💜 and Flutter',
          style: TextStyle(
            color: Color(0xFF8B9099),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
