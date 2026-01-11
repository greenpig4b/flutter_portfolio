import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/app_text_styles.dart';


class SkillDetailDisplay extends StatelessWidget {
  final String skillName;
  final String skillDescription;
  final String? skillImage;
  final Color accentColor;
  final Color textColor;
  final bool isMobile;

  const SkillDetailDisplay({
    Key? key,
    required this.skillName,
    required this.skillDescription,
    required this.accentColor,
    required this.textColor,
    required this.isMobile,
    this.skillImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start, // 모바일일 때 가운데 정렬
      children: [
        if (skillImage != null) ...[
          Container(
            width: isMobile ? 150 : 100, // 모바일일 때 이미지 박스 크기 키움
            height: isMobile ? 150 : 100,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor.withOpacity(0.3)),
            ),
            child: skillImage!.endsWith('svg')
                ? SvgPicture.asset(
              skillImage!,
              width: isMobile ? 120 : 70, // 이미지 자체 크기 (패딩 고려)
              height: isMobile ? 120 : 70,
              fit: BoxFit.contain,
            )
                : Image.asset(
              skillImage!,
              width: isMobile ? 120 : 70, // 이미지 자체 크기
              height: isMobile ? 120 : 70,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: AppSizes.mediumSpacing), // 이미지와 텍스트 사이 간격
        ],
        Text(
          skillName, // 선택된 스킬 이름
          style: AppTextStyles.skillDetailName.copyWith(
            color: accentColor,
            fontSize: isMobile ? 24 : 28, // 모바일일 때 폰트 크기 줄임
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left, // 텍스트 중앙 정렬
        ),
        const SizedBox(height: 15),
        Text(
          skillDescription, // 선택된 스킬 설명
          style: AppTextStyles.skillDetailDescription.copyWith(
            color: textColor,
            fontSize: isMobile ? 14 : 16, // 모바일일 때 폰트 크기 줄임
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left, // 텍스트 중앙 정렬
        ),
      ],
    );
  }
}
