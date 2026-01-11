import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_text_styles.dart';

import 'section_widgets/bouncing_arrow.dart';

class HeroSection extends StatelessWidget {
  final Color accentColor;
  final bool isMobile; // ▼▼▼ [추가] 모바일 여부 받기

  const HeroSection({
    Key? key,
    required this.accentColor,
    required this.isMobile, // ▼▼▼ [추가]
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color fixedTextColor = Colors.white; // Hero 섹션은 항상 어두운 배경이므로 텍스트는 흰색 고정

    return Column(
      children: [
        // 상단 여백 (네비게이션 바 자리 확보용)
        const SizedBox(height: 50),

        // 80% 둥근 사각형 박스
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: isMobile? 400 : 600),
          decoration: BoxDecoration(
            color: AppColors.darkBg,
            borderRadius: BorderRadius.circular(40),
            image: const DecorationImage(
              image: AssetImage('assets/images/resume_hero.jpeg'), // 이미지 경로 확인
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black54, // 이미지 어둡게 (글자 가독성 위해)
                BlendMode.darken,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          padding: EdgeInsets.fromLTRB(isMobile ? 20 : 40, isMobile ? 100 : 180, isMobile ? 20 : 40, 40),

          child: Column(
            children: [
              // 메인 컨텐츠 (텍스트)
              // ▼▼▼ [수정] 모바일일 때는 Column을 가운데 정렬 ▼▼▼
              Row(
                mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.end, // 모바일이면 중앙, PC면 오른쪽
                crossAxisAlignment: CrossAxisAlignment.center, // 세로 중앙 정렬 유지
                children: [
                  Expanded(
                    child: Align(
                      alignment: isMobile ? Alignment.center : Alignment.centerLeft, // 모바일이면 중앙, PC면 왼쪽
                      child: Column(
                        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start, // 텍스트 덩어리 중앙/왼쪽 정렬
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.jobTitle, // PIONEER
                            style: AppTextStyles.heroTitle.copyWith(
                              fontSize: isMobile ? 50 : 60, // 모바일이면 폰트 크기 줄임
                            ),
                            textAlign: isMobile ? TextAlign.center : TextAlign.left, // 텍스트 자체도 중앙/왼쪽 정렬
                          ),
                          const SizedBox(height: AppSizes.mediumSpacing),
                          Text(
                            AppStrings.titlecontent, // Creative Junior Flutter Developer
                            style: AppTextStyles.heroJobTitle.copyWith( // heroJobTitle 스타일 사용
                              fontSize: isMobile ? 18 : 22, // 모바일이면 폰트 크기 줄임
                            ),
                            textAlign: isMobile ? TextAlign.center : TextAlign.left, // 텍스트 자체도 중앙/왼쪽 정렬
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40), // 화살표와 텍스트 사이 간격
              const BouncingArrow(),
            ],
          ),
        ),
      ],
    );
  }
}
