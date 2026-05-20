class AppStrings {
  static const String appTitle = "김지훈";
  // navbar
  static const String navMenuHero = "Home"; // Hero 대신 Home으로 변경
  static const String navMenuAbout = "About";
  static const String navMenuTimeline = "Timeline";
  static const String navMenuSkills = "Skills";
  static const String navMenuProjects = "Projects";
  static const String navMenuContact = "Contact";

  // 네비게이션 메뉴 목록 (순서 중요)
  static final List<String> navMenuItems = [
    navMenuHero,
    navMenuAbout,
    navMenuTimeline,
    navMenuSkills,
    navMenuProjects,
    navMenuContact,
  ];

  // 프로필 정보
  static const String jobTitle = "Flutter \nDeveloper";
  static const String titlecontent =
      "기술의 변화보다 한 걸음 더 빠르게 움직이고\n"
      "사용자에게 더 나은 경험을 주기 위해\n"
      "끊임없이 고민하는 개발자 김지훈입니다.";

  // About Me
  static const String aboutMeTitle = "ABOUT ME";
  static const String aboutMeDescriptionTitle = "저는 이런 사람입니다.";
  static const String aboutMeDescription =
      "안녕하세요, 새로운 가능성을 향해 나아가는 신입 플러터 개발자 김지훈 입니다.\n"
      "작은 아이디어라도 사용자에게 가치를 전달할 수 있는 앱을 만드는 데 열정을 쏟고 있습니다.\n"
      "빠르게 배우고 적용하며, 팀과 함께 성장하는 것에 큰 즐거움을 느낍니다.\n"
      "\n"
      "페이지에서 보시는 것처럼, 웹디자인 경력을 활용하여\n"
      "Flutter를 활용한 반응형 웹/앱 개발,\n"
      "직관적인 UI/UX 구현 제작 능력을 갖추고 있습니다.";

  static const String aboutFlutterCount = "7+";
  static const String aboutFlutterProjectText = "플러터 프로젝트";

  static const String aboutWebDesignCount = "10+";
  static const String aboutWebProjectText = "웹 디자인 프로젝트";


  // Skills
  static const String skillsTitle = "SKILLS";
  static const List<String> skillList = [
    "Flutter", "Dart", "Firebase", "Git & GitHub", "UI/UX Design"
  ];

  static final List<Map<String, dynamic>> skillData = [
    {
      "name": "Flutter & Dart",
      "percentage": 0.9,
      "description": "웹 디자인 경험을 통해 익힌 레이아웃 구성 감각은 Flutter의 위젯 기반 UI 구조를 직관적으로 이해하는 데 큰 자산이 되었습니다. \n"
          "그린컴퓨터 아카데미에서 본격적으로 학습하며, 단일 코드베이스로 iOS와 Android를 동시에 완벽하게 구현할 수 있다는 점에 깊이 매료되었습니다.",
      "imagePath": "assets/images/flutter.svg",
    },
    {
      "name": "Firebase & Superbase",
      "percentage": 0.75,
      "description":"현재 보시는 이 포트폴리오 사이트는 Firebase Hosting을 통해 빠르고 안정적으로 배포하여 운영 중입니다. \n"
          "또한, 현재 진행 중인 개인 프로젝트에서는 Supabase를 도입하여 PostgreSQL 기반의 정교한 데이터 모델링과 인증 시스템을 직접 구현하고 있습니다.\n"
          "프로젝트의 성격에 맞춰 최적의 백엔드 도구를 선정하고 통합하는 풀스택 역량을 키워가고 있습니다.",
      "imagePath": "assets/images/firebase.svg",
    },
    {
      "name": "Git & GitHub",
      "percentage": 0.8,
      "description": "그린컴퓨터 아카데미에서 팀 프로젝트를 수행하며 Git과 GitHub를 처음 접했고, 단순한 코드 저장을 넘어 협업의 필수 도구임을 깨달았습니다. \n"
          "무엇보다 Pull Request와 코드 리뷰, 그리고 충돌(Conflict) 해결 과정을 직접 경험하며 팀원들과 기술적으로 소통하고 효율적으로 협업하는 역량을 키우는 데 큰 밑거름이 되었습니다.",
      "imagePath": "assets/images/git.svg",
    },
    {
      "name": "UI/UX Design",
      "percentage": 0.9,
      "description": "웹디자인 회사에서 근무하며, \n"
          "다양한 클라이언트의 요구사항을 시각적으로 구현하는 과정에서 레이아웃, 컬러 시스템에 대한 깊은 이해를 쌓았습니다. \n"
          "이러한 디자인 베이스는 현재 개발자로서 디자이너와 원활하게 소통하고, 의도한 디자인을 만들 수 있는 역량을 키울 수 있었습니다.",
      "imagePath": "assets/images/figma.svg",
    },
  ];

  // TimeLine
  static const String timeLineTitle = "TIMELINE";
  static final List<Map<String, String>> timelineEvents = [
    {
      "title": "웹디자인 주임",
      "period": "2021.12 - 2023.09",
      "roleOrInstitution": "비즈메이커",
      "description": "전 직장에서 웹디자인 에이전시에서 근무하며 다양한 프로젝트를 통해 실제 사용자 피드백을 반영하고,\n"
          "웹 표준과 접근성을 고려한 디자인을 구현하며 깊이 있는 UX/UI 디자인 경험을 쌓았습니다."
    },
    {
      "title": "ERP & MES 사원",
      "period": "2024.08 - 2024.10",
      "roleOrInstitution": "앤에스비",
      "description": "발주처 ERP 및 MES 시스템 개발 및 유지보수를 현장의 요구사항을 분석하며 데이터의 흐름을 파악하는데 경험을 쌓을 수 있었습니다."
    },
    {
      "title": "현장관리자 대리 \n사이버대학 편입",
      "period": "2024.10 - 2025.11",
      "roleOrInstitution": "신화이엔지 & 고려사이버대학",
      "description": "Mes/Erp 회사 근무중, 스스로의 부족함을 인지하며, 생계를 위해 학업과 일을 병행하기 위해 고려사이버대학 소프트웨어학과에 편입하였습니다.\n"
          "꾸준히 flutter 공부를 위해 개인 프로젝트와 해커톤에 참여하여 성장을 이어가고 있습니다."
    },

  ];

  // Projects
  static const String projectsTitle = "PROJECTS";

  static final List<Map<String, String>> projectsList = [
    {
      "title": "여행가나?여어떻노",
      "subtitle": "Flutter App",
      "description": "그린아카데미에서 처음시작한 Flutter 개발 프로젝트이며, \n"
          "여기어때를 카피하였으며 숙소를 예약 및 결제 할 수 있는 중계 플랫폼입니다.",
      "videoPath": "assets/videos/yeogi_pay.gif",
      "githubUrl": "https://github.com/donghunseol/yeogi_copy"
    },
    {
      "title": "Pink 가계부",
      "subtitle": "Flutter App",
      "description": "두번째로 시작한 Flutter 개발 프로젝트이며, \n"
          "나의 소비 내역 및 패턴을 알 수 있으며, Ai가 소비자의 소비패턴을 분석하여 전달과 비교하여 \n"
          "어느 카테고리에서 소비와 절약이 일어났는지 요약해주는 어플입니다.",
      "videoPath": "assets/videos/pink_account.gif",
      "githubUrl": "https://github.com/greenpig4b/pink-project-flutter"
    },
    {
      "title": "OffPeak",
      "subtitle": "Flutter App",
      "description": "Wanted Laas & 한국관광공사 공공데이터에서 주체한 해커톤 프로젝트이며\n"
          "Ai와 실시간 데이터를 활용하여 혼잡하지 않는 여행지를 추천해주는 스마트 여행앱 입니다. \n",
      "videoPath": "assets/videos/off_peak.gif",
      "githubUrl": "https://github.com/hillview0303/offpeak"
    },
    {
      "title": "웹 포트폴리오",
      "subtitle": "Flutter Web",
      "description": "Flutter Web으로 개발되어 데스크톱과 모바일 환경에 완벽히 대응하는 반응형 웹사이트입니다.\n"
          "개인의 역량과 경험을 효과적으로 전달하기 위해 UI/UX 설계부터 기능 구현, 배포까지 전 과정을 주도적으로 수행했습니다.",
      "videoPath": "assets/images/resume_screenshot.png",
      "githubUrl": "https://github.com/greenpig4b/flutter_portfolio",
    },
    {
      "title": "Pickle",
      "subtitle": "Flutter App · Released",
      "description": "해외여행에 필요한 모든 것을 담은 출시작입니다.\n"
          "실시간 환율 비교, OCR 영수증 자동 인식, 그룹 정산, 환율 알림 등 여행 중 필요한 기능을 한곳에 모았습니다.\n"
          "한국어/영어/일본어/스페인어/중국어 5개 언어를 지원하며, Google Play Store에 정식 출시되었습니다.",
      "videoPath": "assets/images/pickle_logo.png",
      "githubUrl": "",
      "playStoreUrl": "https://play.google.com/store/apps/details?id=com.nestplanet.pickle",
    },
  ];

  // Contact
  static const String contactTitle = "CONTACT";
  static const String email = "greenpig4b@naver.com";
  static const String phone = "010-3334-6852";
  static const String github = "https://github.com/greenpig4b";


}