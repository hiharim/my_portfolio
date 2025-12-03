import 'package:flutter/material.dart';

/// 픽셀 스타일 버튼
/// - 각진 모서리 (border-radius: 0)
/// - 픽셀 그림자 효과 (offset: 3-4px)
/// - 호버/액티브 상태 애니메이션
class PixelButton extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final double fontSize;

  const PixelButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    this.fontSize = 18,
  });

  @override
  State<PixelButton> createState() => _PixelButtonState();
}

class _PixelButtonState extends State<PixelButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(
          _isPressed ? 3 : 0,
          _isPressed ? 3 : 0,
          0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: widget.color,
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.3),
                    offset: const Offset(3, 3),
                  ),
                ],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
