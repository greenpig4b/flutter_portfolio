import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_text_styles.dart'; // 텍스트 스타일 추가



class TimelineItem extends StatelessWidget {
  final Map<String, String> event;
  final Color accentColor;
  final Color textColor;

  const TimelineItem({
    Key? key,
    required this.event,
    required this.accentColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 새로운 필드가 없을 경우를 대비하여 기본값 ('')을 제공합니다.
    final String roleOrInstitution = event["roleOrInstitution"] ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            event["period"] ?? '',
            style: AppTextStyles.timelineItemPeriod.copyWith(color: textColor.withOpacity(0.7)),
          ),
          const SizedBox(height: 10),
          Text(
            event["title"] ?? '',
            style: AppTextStyles.timelineItemTitle.copyWith(color: accentColor),
          ),
          // ✨ 추가된 필드: title과 description 사이에 직함/교육명 삽입
          if (roleOrInstitution.isNotEmpty) // 필드 내용이 있을 때만 표시
            Padding(
              padding: const EdgeInsets.only(top: 5), // title과의 간격
              child: Text(
                roleOrInstitution,
                style: AppTextStyles.timelineItemRoleOrInstitution.copyWith(
                  color: textColor.withOpacity(0.8), // textColor의 80% 투명도로 설정
                ),
              ),
            ),
          const SizedBox(height: 15),
          Text(
            event["description"] ?? '',
            style: AppTextStyles.timelineItemDescription.copyWith(color: textColor.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
}
