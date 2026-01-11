import 'package:flutter/material.dart';

class AppColors {
  // 테마 배경색 (Light / Dark)
  static const Color lightBg = Colors.white;
  static const Color darkBg = Color(0xFF0F172A); // 아주 짙은 네이비

  // 테마 텍스트 색상 (Light / Dark)
  static const Color lightText = Color(0xFF1E293B); // 짙은 회색
  static const Color darkText = Color(0xFFF1F5F9);  // 밝은 회색

  // 포인트(Accent) 컬러
  static const Color primaryNavy = Color(0xFF1A237E);
  static const Color primaryBlue = Color(0xFF64B5F6);

  // 프로젝트 카드 관련
  static const Color memoAppColor = Colors.indigoAccent;
  static const Color portfolioAppColor = Colors.teal;

  // 고정컬러
  static const Color fixedWhiteColor = AppColors.darkText;
  static const Color fixedBlueColor =  AppColors.primaryBlue;

}
