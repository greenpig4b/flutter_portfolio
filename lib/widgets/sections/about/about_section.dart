import 'package:flutter/material.dart';
import 'package:jihun_flutter_resume/widgets/sections/about/section_widgets/aboutProfileImage.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_text_styles.dart';
import '../../common/custom_widgets.dart';

class AboutSection extends StatelessWidget {
  final Color accentColor;
  final Color textColor;
  final bool isMobile;

  const AboutSection({
    Key? key,
    required this.accentColor,
    required this.textColor,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // [이미지 위젯] - 화면 크기에 비례하여 자동 조절
    double imageSize = isMobile
        ? (screenWidth * 0.6).clamp(150, 350)   // 모바일: 화면의 60%, 최소 150 최대 350
        : (screenWidth * 0.2).clamp(200, 500);   // 데스크톱: 화면의 20%, 최소 200 최대 500

    Widget imagePart = AboutProfileImage(
      accentColor: accentColor,
      size: imageSize,
    );

    // 카운터 폰트 크기도 화면에 비례
    double countFontSize = isMobile ? 36 : (screenWidth * 0.03).clamp(30, 60);
    double labelFontSize = isMobile ? 13 : (screenWidth * 0.01).clamp(12, 18);
    double bodyFontSize = isMobile ? 14 : (screenWidth * 0.01).clamp(14, 18);

    Widget textPart = Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        Row(
          // 모바일이면 카운터들을 양옆으로 꽉 채우거나(spaceBetween) 중앙 정렬
          mainAxisAlignment: MainAxisAlignment.start, // ▼▼▼ [수정 2] 모바일일 때 카운터 중앙 정렬 ▼▼▼
          children: [
            // Web Design Count
            Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.aboutWebDesignCount,
                  style: AppTextStyles.aboutCount.copyWith(
                    color: accentColor,
                    fontSize: countFontSize,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  AppStrings.aboutWebProjectText,
                  style: AppTextStyles.aboutProjectText.copyWith(
                    color: textColor,
                    fontSize: labelFontSize,
                  ),
                ),
              ],
            )),

            SizedBox(width: isMobile ? 20 : AppSizes.largeSpacing),

            // Flutter Count
            Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.aboutFlutterCount,
                  style: AppTextStyles.aboutCount.copyWith(
                    color: accentColor,
                    fontSize: countFontSize,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  AppStrings.aboutFlutterProjectText,
                  style: AppTextStyles.aboutProjectText.copyWith(
                    color: textColor,
                    fontSize: labelFontSize,
                  ),
                ),
              ],
            )),
          ],
        ),

        const SizedBox(height: AppSizes.mediumSpacing),

        // 설명 텍스트
        Text(
          AppStrings.aboutMeDescriptionTitle,
          style: AppTextStyles.aboutMeSubtitleStyle.copyWith(
            color: textColor,
            fontSize: isMobile ? 18 : (screenWidth * 0.012).clamp(16, 22),
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 15),
        Text(
          AppStrings.aboutMeDescription,
          style: AppTextStyles.bodyText.copyWith(
            color: textColor,
            fontSize: bodyFontSize,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );

    // 2. 실제 레이아웃 구성 (반응형 분기 처리)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.aboutMeTitle, color: accentColor),

        // ▼▼▼ [핵심] 모바일이면 Column, PC면 Row ▼▼▼
        if (isMobile)
        // [Mobile Layout] 세로 배치
          Column(
            // ▼▼▼ [수정 5] Column 전체를 가운데 정렬 ▼▼▼
            crossAxisAlignment: CrossAxisAlignment.center, // Column 내부 자식들을 가운데로
            children: [
              imagePart, // 이미지는 이미 Center로 감싸져 있음
              const SizedBox(height: 40),
              Container( // ▼▼▼ [수정 6] textPart도 중앙 정렬 위해 Container로 감싸고 width 지정 ▼▼▼
                width: double.infinity, // 부모의 너비를 꽉 채워서 가운데 정렬이 잘 되도록
                child: textPart,
              ),
            ],
          )
        else
        // [PC Layout] 가로 배치
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: imagePart),
              const SizedBox(width: AppSizes.mediumSpacing),
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.topRight,
                    child: textPart
                ),
              ),
            ],
          ),

        const SizedBox(height: AppSizes.sectionSpacing),
      ],
    );
  }
}