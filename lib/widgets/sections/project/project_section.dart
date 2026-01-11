import 'package:flutter/material.dart';
import 'package:jihun_flutter_resume/widgets/sections/project/section_widgets/project_card.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../common/custom_widgets.dart';


class ProjectsSection extends StatelessWidget {
  final Color accentColor;
  final Color textColor;
  final bool isMobile;

  const ProjectsSection({
    Key? key,
    required this.accentColor,
    required this.textColor,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.projectsTitle, color: accentColor),


        ...AppStrings.projectsList.map((project) => ProjectCard(
          title: project['title']!,
          subtitle: project['subtitle']!,
          description: project['description']!,
          videoPath: project['videoPath']!,
          accentColor: accentColor,
          textColor: textColor,
          isMobile: isMobile,
          githubUrl: project['githubUrl']!,
        )).toList(),

        const SizedBox(height: AppSizes.sectionSpacing),
      ],
    );
  }
}
