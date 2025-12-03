import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

/// 픽셀아트 개발자 캐릭터
/// 크기: 60px × 96px (5×8 블록)
/// 각 픽셀: 12px × 12px
class PixelCharacter extends StatelessWidget {
  const PixelCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 96,
      child: Column(
        children: [
          // Row 1: 머리카락 상단
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(Colors.transparent),
              _pixel(AppColors.pixelHair),
              _pixel(AppColors.pixelHair),
              _pixel(AppColors.pixelHair),
              _pixel(Colors.transparent),
            ],
          ),
          // Row 2: 머리카락 + 얼굴
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(AppColors.pixelHair),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelHair),
            ],
          ),
          // Row 3: 얼굴 + 눈
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelHair),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelHair),
              _pixel(AppColors.pixelSkin),
            ],
          ),
          // Row 4: 얼굴 하단
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.pixelSkin),
            ],
          ),
          // Row 5: 몸통 상단
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(Colors.transparent),
              _pixel(AppColors.primary),
              _pixel(AppColors.primary),
              _pixel(AppColors.primary),
              _pixel(Colors.transparent),
            ],
          ),
          // Row 6: 몸통 중간 (팔)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(AppColors.pixelSkin),
              _pixel(AppColors.primary),
              _pixel(AppColors.primary),
              _pixel(AppColors.primary),
              _pixel(AppColors.pixelSkin),
            ],
          ),
          // Row 7: 몸통 하단
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(Colors.transparent),
              _pixel(AppColors.primary),
              _pixel(AppColors.primary),
              _pixel(AppColors.primary),
              _pixel(Colors.transparent),
            ],
          ),
          // Row 8: 다리
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pixel(Colors.transparent),
              _pixel(AppColors.pixelHair),
              _pixel(Colors.transparent),
              _pixel(AppColors.pixelHair),
              _pixel(Colors.transparent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pixel(Color color) {
    return Container(
      width: 12,
      height: 12,
      color: color,
    );
  }
}
