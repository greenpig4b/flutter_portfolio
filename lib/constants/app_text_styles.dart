import 'package:flutter/material.dart';
import 'app_colors.dart'; // 색상 파일도 가져와서 조합 가능

class AppTextStyles {

  static const String fontFamily = "Roboto";

  static const TextStyle navBarTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    letterSpacing: 1.5,
  );

  //navbar 버튼
  static const TextStyle navButtonTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18, // 기본 폰트 크기
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
  );

  // 섹션용 스타일
  static const TextStyle heroTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 100,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    letterSpacing: 1.5,
    height: 1,
  );

  static const TextStyle heroJobTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );


  static const TextStyle sectionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.5,
  );

  static const TextStyle sectionContent = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );


  // 본문용 스타일
  static const TextStyle bodyText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.6, // 줄 간격
    color: AppColors.lightText,
  );

  // 네비게이션 버튼용 스타일
  static const TextStyle navButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  //  aboutme count
  static const TextStyle aboutCount =  TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle aboutProjectText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle aboutMeSubtitleStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 26, //
    fontWeight: FontWeight.w700, // 굵게 강조
    letterSpacing: 0.5,
  );

  // 스킬바
  static const TextStyle skillDetailName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.8,
  );

  static const TextStyle skillDetailDescription = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  // 연혁
  static const TextStyle timelineItemTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.8,
  );

  static const TextStyle timelineItemPeriod = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static const TextStyle timelineItemDescription = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    height: 1.5,
  );

  static const TextStyle timelineItemRoleOrInstitution = TextStyle(
    fontSize: 16, // title(20)보다 작게
    fontWeight: FontWeight.w500, // 약간 굵게
  );

  static const TextStyle contactCardBodyText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: Colors.white, // 흰색 계열
    fontWeight: FontWeight.w500,
  );
}
