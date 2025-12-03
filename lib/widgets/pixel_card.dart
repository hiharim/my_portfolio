import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class PixelCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const PixelCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });
 @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // 원래 AppColors.card였던 거를 일단 흰색 근처로
        borderRadius: BorderRadius.zero,
        border: Border.all(
          color: AppColors.lineDark.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: const [], // 일단 그림자(3,3) 없애보기
      ),
      padding: padding,
      child: child,
    );
  }
}
