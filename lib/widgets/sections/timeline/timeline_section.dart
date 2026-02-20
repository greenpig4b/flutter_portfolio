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
    bool isMobile = screenWidth < AppSizes.mobileBreakpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.timeLineTitle, color: accentColor),
        const SizedBox(height: 10),

        // 모바일일 때는 세로(Column), 데스크톱일 때는 가로(Row + Expanded)
        if (isMobile)
          Column(
            children: AppStrings.timelineEvents.map((event) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TimelineItem(
                    event: event,
                    accentColor: accentColor,
                    textColor: textColor,
                  ),
                ),
              );
            }).toList(),
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AppStrings.timelineEvents.map((event) => Expanded(
              child: TimelineItem(
                event: event,
                accentColor: accentColor,
                textColor: textColor,
              ),
            )).toList(),
          ),

        const SizedBox(height: AppSizes.sectionSpacing),
      ],
    );
  }
}