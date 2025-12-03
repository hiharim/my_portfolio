class AppStrings {
  static const Map<String, Map<String, String>> _strings = {
    'appName': {'ko': '아이디어뱅크', 'en': 'IDEABANK'},
    'hello': {'ko': '안녕하세요!', 'en': 'HELLO WORLD!'},
    'iAm': {'ko': '저는', 'en': 'I AM'},
    'dev': {'ko': '개발자', 'en': 'DEV'},
    'exp3Years': {'ko': '3년차 경력 | 아이디어 메이커', 'en': '3 YEARS EXP | IDEA MAKER'},
    'projects': {'ko': '프로젝트', 'en': 'PROJECTS'},
    'contact': {'ko': '연락하기', 'en': 'CONTACT'},
    'skills': {'ko': '스킬', 'en': 'SKILLS'},
    'about': {'ko': '소개', 'en': 'ABOUT'},
    'ideaBank': {'ko': '아이디어 뱅크', 'en': 'IDEA BANK'},
    
    // About
    'status': {'ko': '상태', 'en': 'STATUS'},
    'class': {'ko': '직업', 'en': 'CLASS'},
    'mobileDev': {'ko': '모바일 개발자', 'en': 'MOBILE DEVELOPER'},
    'experience': {'ko': '경력', 'en': 'EXP'},
    'years3': {'ko': '3년', 'en': '3 YEARS'},
    'apps': {'ko': '출시 앱', 'en': 'APPS'},
    'appsCount': {'ko': '15개 이상', 'en': '15+ RELEASED'},
    'ideas': {'ko': '아이디어', 'en': 'IDEAS'},
    'ideasCount': {'ko': '50개 이상', 'en': '50+ IN BANK'},
    'bio': {'ko': '소개', 'en': 'BIO'},
    'bioText': {
      'ko': 'Android Native에서 Flutter까지.\nMVVM & Clean Architecture.\n아이디어 메이커 & 문제 해결사.',
      'en': 'ANDROID NATIVE TO FLUTTER.\nMVVM & CLEAN ARCHITECTURE.\nIDEA MAKER & PROBLEM SOLVER.'
    },
    
    // Skills
    'architecture': {'ko': '아키텍처', 'en': 'ARCH'},
    'tools': {'ko': '도구', 'en': 'TOOLS'},
    
    // Projects
    'commerceApp': {'ko': '커머스 앱', 'en': 'COMMERCE APP'},
    'commerceDesc': {'ko': '쇼핑 · 50만 MAU', 'en': 'SHOPPING · 500K MAU'},
    'fintechApp': {'ko': '핀테크 앱', 'en': 'FINTECH APP'},
    'fintechDesc': {'ko': '결제 · 보안', 'en': 'PAYMENT · SECURE'},
    'healthApp': {'ko': '헬스 트래커', 'en': 'HEALTH TRACKER'},
    'healthDesc': {'ko': '피트니스 · 차트', 'en': 'FITNESS · CHARTS'},
    'chatApp': {'ko': '채팅 앱', 'en': 'CHAT APP'},
    'chatDesc': {'ko': '실시간 · 푸시', 'en': 'REALTIME · PUSH'},
    'ideaNote': {'ko': '아이디어 노트', 'en': 'IDEA NOTE'},
    'ideaDesc': {'ko': '동기화 · 태그', 'en': 'SYNC · TAGS'},
    'locationApp': {'ko': '위치 서비스', 'en': 'LOCATION SVC'},
    'locationDesc': {'ko': '지도 · 리뷰', 'en': 'MAPS · REVIEW'},
    
    // Ideas
    'currentIdeas': {'ko': '현재 아이디어', 'en': 'CURRENT IDEAS'},
    'gamificationApp': {'ko': '게이미피케이션 앱', 'en': 'GAMIFICATION APP'},
    'aiHelper': {'ko': 'AI 코드 도우미', 'en': 'AI CODE HELPER'},
    'devTracker': {'ko': '개발자 트래커', 'en': 'DEV TRACKER'},
    'widgetLib': {'ko': '위젯 라이브러리', 'en': 'WIDGET LIB'},
    'inDev': {'ko': '개발중', 'en': 'IN DEV'},
    'planning': {'ko': '계획중', 'en': 'PLANNING'},
    'research': {'ko': '리서치', 'en': 'RESEARCH'},
    'total': {'ko': '전체', 'en': 'TOTAL'},
    'active': {'ko': '진행중', 'en': 'ACTIVE'},
    'done': {'ko': '완료', 'en': 'DONE'},
    
    // Contact
    'connect': {'ko': '연결', 'en': 'CONNECT'},
    'email': {'ko': '이메일', 'en': 'EMAIL'},
    'location': {'ko': '위치', 'en': 'LOCATION'},
    'seoul': {'ko': '서울, 한국', 'en': 'SEOUL, KR'},
    'social': {'ko': '소셜', 'en': 'SOCIAL'},
    'sendMsg': {'ko': '메시지 보내기', 'en': 'SEND MSG'},
    'name': {'ko': '이름', 'en': 'NAME'},
    'message': {'ko': '메시지', 'en': 'MESSAGE'},
    'send': {'ko': '보내기', 'en': 'SEND'},
    'footer': {'ko': '© 2024 💚와 Flutter로 제작', 'en': '© 2024 MADE WITH 💚 & FLUTTER'},
  };

  static String get(String key, String lang) {
    return _strings[key]?[lang] ?? _strings[key]?['en'] ?? key;
  }
}
