import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PixelBox extends StatelessWidget {
  final Widget child;
  final Color? borderColor;

  const PixelBox({super.key, required this.child, this.borderColor});

  @override
  Widget build(BuildContext context) {
    final color = borderColor ?? AppColors.border;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: color, width: 3),
      ),
      child: child,
    );
  }
}
