import 'package:flutter/material.dart';

/// 섹션 타이틀 컴포넌트
/// 16×16 컬러 블록 + 28px 텍스트
class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;

  const SectionTitle({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
