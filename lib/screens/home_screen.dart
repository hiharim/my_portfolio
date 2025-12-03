// import 'package:flutter/material.dart';
// import '../widgets/hero_section.dart';
// import '../widgets/projects_section.dart';
// import '../widgets/experience_section.dart';
// import '../widgets/skills_section.dart';
// import '../widgets/contact_section.dart';
// import '../utils/app_colors.dart';
// import '../utils/language_provider.dart';

// class HomeScreen extends StatelessWidget {
//   final LanguageProvider langProvider;

//   const HomeScreen({super.key, required this.langProvider});

//   @override
//   Widget build(BuildContext context) {
//     final lang = langProvider.currentLang;

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.surface,
//         elevation: 0,
//         title: Row(
//           children: [
//             Container(
//               width: 28,
//               height: 28,
//               color: AppColors.primary,
//               child: const Center(child: Text('💡', style: TextStyle(fontSize: 16))),
//             ),
//             const SizedBox(width: 12),
//             Text(
//               lang == 'ko' ? '포트폴리오' : 'PORTFOLIO',
//               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () => langProvider.toggleLanguage(),
//             child: Co const EdgeInsets.only(right: 16),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.primary, width: 3),
//               ),
//               child: Text(
//                 lang == 'ko' ? 'EN' : '한국어',
//                 style: const TextStyle(fontSize: 20, color: AppColors.primary),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeroSection(lang: lang),
//             const SizedBox(height: 48),
//             SkillsSection(lang: lang),
//             const SizedBox(height: 48),
//             ProjectsSection(lang: lang),
//             const SizedBox(height: 48),
//             ContactSection(lang: lang),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }
