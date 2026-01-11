import 'package:flutter/material.dart';
import 'package:jihun_flutter_resume/widgets/sections/timeline/section_widget/time_line_item.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../common/custom_widgets.dart';

class TimelineSection extends StatelessWidget {
  final Color accentColor;
  final Color textColor;

  const TimelineSection({
    Key? key,
    required this.accentColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < AppSizes.mobileBreakpoint; // 모바일 체크 필요

    // [수정된 로직 설명]
    // 1. HomeScreen의 컨텐츠 영역 너비를 구합니다.
    //    - 모바일이면 화면 전체(1.0), 아니면 60%(0.6)를 사용합니다.
    double contentWidth = isMobile ? screenWidth : screenWidth * 0.6;

    // 2. 컨텐츠 영역 너비를 5로 나눕니다.
    //    (모바일에서는 너무 좁아지므로 모바일은 2.5개 정도 보이게 조정하는 것이 좋습니다)
    double itemWidth = isMobile
        ? contentWidth / 2.2  // 모바일: 약 2개 반 보이게 (가독성 확보)
        : contentWidth / 5;   // 데스크톱: 정확히 5개 보이게

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.timeLineTitle, color: accentColor),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: AppStrings.timelineEvents.map((event) => SizedBox(
              width: itemWidth,
              child: TimelineItem(
                event: event,
                accentColor: accentColor,
                textColor: textColor,
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: AppSizes.sectionSpacing),
      ],
    );
  }
}
