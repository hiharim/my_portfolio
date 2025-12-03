import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/ideas_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/floating_ideas_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;

  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Update current section based on scroll position
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
    setState(() => _currentSection = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Stack(
        children: [
          const FloatingIdeasBackground(),
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              _buildAppBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  HeroSection(key: _sectionKeys[0]),
                  AboutSection(key: _sectionKeys[1]),
                  SkillsSection(key: _sectionKeys[2]),
                  ProjectsSection(key: _sectionKeys[3]),
                  IdeasSection(key: _sectionKeys[4]),
                  ContactSection(key: _sectionKeys[5]),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      elevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFFFF6B9D)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.lightbulb_outline, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Text(
            'IdeaBank',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF2D3142),
            ),
          ),
        ],
      ),
      actions: _buildNavItems(),
    );
  }

  List<Widget> _buildNavItems() {
    final items = ['Home', 'About', 'Skills', 'Projects', 'Ideas', 'Contact'];
    return [
      ...items.asMap().entries.map((entry) {
        return TextButton(
          onPressed: () => _scrollToSection(entry.key),
          child: Text(
            entry.value,
            style: TextStyle(
              color: _currentSection == entry.key
                  ? const Color(0xFF6C63FF)
                  : const Color(0xFF5D6470),
              fontWeight: _currentSection == entry.key
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        );
      }),
      const SizedBox(width: 16),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
