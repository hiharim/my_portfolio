import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLang = 'ko';

  String get currentLang => _currentLang;
  bool get isKorean => _currentLang == 'ko';

  void toggleLanguage() {
    _currentLang = _currentLang == 'ko' ? 'en' : 'ko';
    notifyListeners();
  }

  void setLanguage(String lang) {
    _currentLang = lang;
    notifyListeners();
  }
}
