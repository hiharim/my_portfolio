import 'dart:math';
import 'package:flutter/material.dart';

class FloatingIdeasBackground extends StatefulWidget {
  const FloatingIdeasBackground({super.key});

  @override
  State<FloatingIdeasBackground> createState() => _FloatingIdeasBackgroundState();
}

class _FloatingIdeasBackgroundState extends State<FloatingIdeasBackground>
    with TickerProviderStateMixin {
  late List<FloatingIdea> _ideas;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _ideas = List.generate(15, (index) => FloatingIdea.random());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: IdeasPainter(_ideas, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class FloatingIdea {
  final double x;
  final double y;
  final double size;
  final double speed;
  final IconData icon;
  final Color color;

  FloatingIdea({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.icon,
    required this.color,
  });

  factory FloatingIdea.random() {
    final random = Random();
    final icons = [
      Icons.lightbulb_outline,
      Icons.code,
      Icons.phone_android,
      Icons.rocket_launch,
      Icons.auto_awesome,
      Icons.psychology,
      Icons.widgets,
      Icons.cloud,
    ];
    final colors = [
      const Color(0xFF6C63FF),
      const Color(0xFFFF6B9D),
      const Color(0xFF00D9FF),
      const Color(0xFFFFD93D),
      const Color(0xFF6BCB77),
    ];

    return FloatingIdea(
      x: random.nextDouble(),
      y: random.nextDouble(),
      size: 20 + random.nextDouble() * 30,
      speed: 0.5 + random.nextDouble() * 1.5,
      icon: icons[random.nextInt(icons.length)],
      color: colors[random.nextInt(colors.length)].withValues(alpha: 0.15),
    );
  }
}

class IdeasPainter extends CustomPainter {
  final List<FloatingIdea> ideas;
  final double animationValue;

  IdeasPainter(this.ideas, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var idea in ideas) {
      final x = (idea.x * size.width + animationValue * idea.speed * 100) % size.width;
      final y = (idea.y * size.height + sin(animationValue * 2 * pi * idea.speed) * 50);

      final paint = Paint()
        ..color = idea.color.withValues(alpha: 0.08)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), idea.size / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
