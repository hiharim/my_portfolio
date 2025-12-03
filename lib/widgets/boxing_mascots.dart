import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class BoxingMascots extends StatefulWidget {
  const BoxingMascots({super.key});

  @override
  State<BoxingMascots> createState() => _BoxingMascotsState();
}

class _BoxingMascotsState extends State<BoxingMascots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _punch;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat(reverse: true);

    _punch = Tween<double>(begin: 0, end: 6).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 160,
        height: 110,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: AppColors.lineDark, width: 2),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lineDark,
              offset: Offset(3, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: AnimatedBuilder(
          animation: _punch,
          builder: (context, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: Offset(_punch.value, 0),
                  child: const _AndroidBoxer(),
                ),
                Transform.translate(
                  offset: Offset(-_punch.value, 0),
                  child: const _FlutterBoxer(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AndroidBoxer extends StatelessWidget {
  const _AndroidBoxer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 머리
        Container(
          width: 26,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xFF3DDC84), // 안드로이드 그린
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.lineDark, width: 2),
          ),
        ),
        const SizedBox(height: 4),
        // 몸 + 글러브
        Row(
          children: [
            Container(
              width: 10,
              height: 18,
              color: AppColors.card,
            ),
            Container(
              width: 20,
              height: 18,
              color: const Color(0xFF3DDC84),
            ),
            Container(
              width: 10,
              height: 18,
              color: AppColors.card,
            ),
          ],
        ),
      ],
    );
  }
}

class _FlutterBoxer extends StatelessWidget {
  const _FlutterBoxer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 26,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xFF38BDF8), // 플러터 블루 느낌
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.lineDark, width: 2),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              width: 10,
              height: 18,
              color: AppColors.card,
            ),
            Container(
              width: 20,
              height: 18,
              color: const Color(0xFF38BDF8),
            ),
            Container(
              width: 10,
              height: 18,
              color: AppColors.card,
            ),
          ],
        ),
      ],
    );
  }
}
