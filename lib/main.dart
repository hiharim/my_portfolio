import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/portfolio_page.dart';
import 'screens/home_screen.dart';
import 'utils/app_colors.dart';
import 'utils/language_provider.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  final LanguageProvider _langProvider = LanguageProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _langProvider,
      builder: (context, child) {
        return MaterialApp(
          title: 'Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            scaffoldBackgroundColor: AppColors.background,
            textTheme: GoogleFonts.notoSansKrTextTheme(), // 전체 기본
            useMaterial3: true,
          ),
           home: PortfolioPage(),
          // home: HomeScreen(langProvider: _langProvider),
        );
      },
    );
  }
}
