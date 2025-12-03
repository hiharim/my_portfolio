import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/widgets/boxing_mascots.dart';
import 'package:my_portfolio/widgets/pixel_card.dart';
import 'package:my_portfolio/widgets/project_content.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // TODO: SeasonalBackground() 넣을 자리
          // const SeasonalBackground(),

          // 베이지 오버레이로 배경 살짝 죽이기 (픽셀아트 위에 얇게 덮는 용도)
          Container(color: AppColors.background.withValues(alpha: 0.9)),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    HeaderNavSection(),
                    SizedBox(height: 56),
                    HeroSection(),
                    SizedBox(height: 80),
                    Section(
                      title: 'ABOUT',
                      child: AboutContent(),
                    ),
                    SizedBox(height: 80),
                    Section(
                      title: 'SKILLS',
                      child: SkillsContent(),
                    ),
                    SizedBox(height: 80),
                    Section(
                      title: 'EXPERIENCE',
                      child: ExperienceContent(),
                    ),
                    SizedBox(height: 80),
                    Section(
                      title: 'PROJECTS',
                      child: ProjectsContent(),
                    ),
                    SizedBox(height: 80),
                    Section(
                      title: 'CONTACT',
                      child: ContactContent(),
                    ),
                    SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),

          // 오른쪽 아래 픽셀 복싱 캐릭터 자리
          const Positioned(
            right: 24,
            bottom: 24,
            child: BoxingMascots(),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 3,
            color: AppColors.lineDark,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

}

/// -------------------------------
/// Header / Navigation
/// -------------------------------
class HeaderNavSection extends StatelessWidget {
  const HeaderNavSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 720;

    final title = Text(
      'HARIM PORTFOLIO',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 3,
        color: AppColors.lineDark,
      ),
    );

    final nav = Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _NavItem(label: 'About'),
        _NavItem(label: 'Skills'),
        _NavItem(label: 'Experience'),
        _NavItem(label: 'Projects'),
        _NavItem(label: 'Contact'),
      ],
    );

    if (isNarrow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(height: 16),
          nav,
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        nav,
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;

  const _NavItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 2,
            color: AppColors.textSub,
          ),
        ),
      ),
    );
  }
}

/// -------------------------------
/// Hero Section
/// -------------------------------
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 800;

    final textBlock = Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '조하림 · Mobile Developer',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.lineDark,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Flutter와 Android로 실서비스를 운영해본\n3년 차 모바일 앱 개발자입니다.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: AppColors.textMain,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '결제 · 쿠폰 · 리스트 성능 최적화처럼\n숫자로 증명되는 문제 해결에 재미를 느낍니다.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textSub,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _PrimaryButton(
                label: 'Resume',
                onTap: () {
                  // TODO: url_launcher로 이력서 링크 연결
                },
              ),
              const SizedBox(width: 12),
              _OutlineButton(
                label: 'GitHub',
                onTap: () {
                  // TODO: url_launcher로 GitHub 연결
                },
              ),
            ],
          ),
        ],
      ),
    );

    final visual = Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: PixelCard(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ANDROID × FLUTTER',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: AppColors.lineDark,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'PIXEL BOXING DEV',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSub,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '실서비스 성능 · 지표 개선에 집중합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textSub,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (isNarrow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBlock,
          const SizedBox(height: 32),
          visual,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textBlock,
        const SizedBox(width: 32),
        visual,
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: AppColors.lineDark, width: 2),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lineDark,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlineButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: AppColors.lineDark, width: 2),
          ),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
              color: AppColors.lineDark,
            ),
          ),
        ),
      ),
    );
  }
}

/// -------------------------------
/// About
/// -------------------------------
class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '정보통계학 전공 후, 3년 차 모바일 앱 개발자로 일하고 있습니다.\n'
            'Flutter와 Android를 모두 사용해 결제, 쿠폰, 리스트, 이벤트 등\n'
            '실제 매출과 연결된 기능들을 만들고 운영해왔습니다.\n\n'
            '문제를 수치로 정의하고, 개선 결과를 지표로 남기는 걸 좋아하며\n'
            '기획 · 디자인 · QA와 함께 제품을 다듬는 과정을 즐깁니다.',
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: AppColors.textMain,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _TagChip(label: '실서비스 운영 경험'),
              _TagChip(label: '성능 · 지표 개선'),
              _TagChip(label: 'Flutter & Android'),
              _TagChip(label: '커뮤니케이션 · 오너십'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.zero,
        border: Border.all(color: AppColors.lineDark, width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          color: AppColors.textMain,
        ),
      ),
    );
  }
}

/// -------------------------------
/// Skills
/// -------------------------------
class SkillsContent extends StatelessWidget {
  const SkillsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SkillRow(
            category: 'Languages',
            items: 'Kotlin · Dart · Java(읽기) · SQL',
          ),
          SizedBox(height: 8),
          _SkillRow(
            category: 'Mobile',
            items: 'Flutter(iOS/Android/Web), Android Native(Jetpack)',
          ),
          SizedBox(height: 8),
          _SkillRow(
            category: 'Arch/State',
            items: 'MVVM, Riverpod, Provider, 간단한 Clean 구조',
          ),
          SizedBox(height: 8),
          _SkillRow(
            category: 'Tools',
            items: 'Git/GitHub, Firebase, FCM, Analytics, Sentry',
          ),
        ],
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final String category;
  final String items;

  const _SkillRow({
    required this.category,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.lineDark,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            items,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: AppColors.textMain,
            ),
          ),
        ),
      ],
    );
  }
}

/// -------------------------------
/// Experience
/// -------------------------------
class ExperienceContent extends StatelessWidget {
  const ExperienceContent({super.key});

  // 경력 데이터 - 여기에 추가하면 자동으로 표시됨
  static const experiences = [
    _Experience(
      company: 'Trinity M',
      companyType: '스타트업',
      period: '2023.01 ~ 현재',
      role: 'Mobile Developer',
      stack: 'Flutter · Android',
      achievements: [
        _Achievement(
          icon: '📦',
          title: '상품 리스트 성능 개선',
          problem: 'NFT 기프트카드 앱의 리스트 응답 지연 (350ms)',
          solution: '페이지네이션 + 로컬 캐시 + 스켈레톤 UI',
          result: '응답 속도 350ms → 20ms, 이탈률 감소',
        ),
        _Achievement(
          icon: '💳',
          title: '결제 시스템 리팩토링',
          problem: '토스페이먼츠 등 복잡한 결제 분기 로직',
          solution: '공통 결제 인터페이스 + 상태 관리 분리',
          result: '신규 결제 수단 추가 시간 단축, 버그 감소',
        ),
        _Achievement(
          icon: '🎫',
          title: '쿠폰/기프트카드 교환 시스템',
          problem: '잦은 기획 변경으로 조건 분기 복잡도 증가',
          solution: '교환 정책 enum 분리 + 상태 구독 패턴',
          result: '기획 변경 대응 시간 단축',
        ),
      ],
    ),
    _Experience(
      company: 'Personal Projects',
      companyType: '개인',
      period: '2024',
      role: 'Full Stack Developer',
      stack: 'Flutter Web',
      achievements: [
        _Achievement(
          icon: '🥊',
          title: 'Shadow Boxing UGC 앱',
          problem: '복싱 콤비네이션 기억 및 반복 연습 어려움',
          solution: '블록 기반 콤비 에디터 + 타임라인 재생',
          result: '복싱장 지인 3명 실사용, GitHub Pages 배포',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: experiences
          .map((exp) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ExperienceCard(experience: exp),
              ))
          .toList(),
    );
  }
}

class _Experience {
  final String company;
  final String companyType;
  final String period;
  final String role;
  final String stack;
  final List<_Achievement> achievements;

  const _Experience({
    required this.company,
    required this.companyType,
    required this.period,
    required this.role,
    required this.stack,
    required this.achievements,
  });
}

class _Achievement {
  final String icon;
  final String title;
  final String problem;
  final String solution;
  final String result;

  const _Achievement({
    required this.icon,
    required this.title,
    required this.problem,
    required this.solution,
    required this.result,
  });
}

class _ExperienceCard extends StatelessWidget {
  final _Experience experience;

  const _ExperienceCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    return PixelCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 회사 헤더
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  border: Border.all(color: AppColors.lineDark, width: 2),
                ),
                child: Text(
                  experience.companyType.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  experience.company,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.lineDark,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 2),
              Text(
                '📅',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 6),
              Text(
                experience.period,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                '👤',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 6),
              Text(
                experience.role,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textMain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const SizedBox(width: 2),
              Text(
                '🛠️',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 6),
              Text(
                experience.stack,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 구분선
          Container(
            height: 2,
            color: AppColors.lineDark,
          ),
          const SizedBox(height: 16),
          // 성과 목록
          ...experience.achievements.map(
            (achievement) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _AchievementItem(achievement: achievement),
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final _Achievement achievement;

  const _AchievementItem({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.lineDark, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                achievement.icon,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  achievement.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lineDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _InfoRow(label: '문제', value: achievement.problem, color: AppColors.accent),
          const SizedBox(height: 4),
          _InfoRow(label: '해결', value: achievement.solution, color: AppColors.primary),
          const SizedBox(height: 4),
          _InfoRow(label: '결과', value: achievement.result, color: AppColors.purple),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: AppColors.lineDark, width: 1),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
                color: AppColors.textMain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// -------------------------------
/// Contact
/// -------------------------------
class ContactContent extends StatelessWidget {
  const ContactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '협업 제안, 이직 관련 문의 등 편하게 연락 주세요.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textMain,
            ),
          ),
          SizedBox(height: 16),
          _ContactRow(
            label: 'Email',
            value: 'your.email@example.com', // TODO: 실제 메일로 변경
          ),
          SizedBox(height: 8),
          _ContactRow(
            label: 'GitHub',
            value: 'github.com/your-id', // TODO: 실제 GitHub로 변경
          ),
          SizedBox(height: 8),
          _ContactRow(
            label: 'LinkedIn',
            value: 'linkedin.com/in/your-id', // 선택사항
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final String label;
  final String value;

  const _ContactRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.lineDark,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textMain,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}


