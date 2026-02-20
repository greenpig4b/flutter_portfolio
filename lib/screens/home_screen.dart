import 'package:flutter/material.dart';
import 'package:jihun_flutter_resume/widgets/sections/contact/contact_section.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_sizes.dart';
import '../widgets/common/sticky_nav_bar.dart';
import '../widgets/sections/about/about_section.dart';
import '../widgets/sections/hero/hero_section.dart';
import '../widgets/common/custom_widgets.dart';
import '../widgets/sections/project/project_section.dart';
import '../widgets/sections/skill/skills_section.dart';
import '../widgets/sections/timeline/timeline_section.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  final GlobalKey _heroSectionKey = GlobalKey();
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _timelineSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  late final Map<String, GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.offset;
      });
    });

    _sectionKeys = {
      AppStrings.navMenuHero: _heroSectionKey,
      AppStrings.navMenuAbout: _aboutSectionKey,
      AppStrings.navMenuSkills: _skillsSectionKey,
      AppStrings.navMenuProjects: _projectsSectionKey,
      AppStrings.navMenuTimeline: _timelineSectionKey,
      AppStrings.navMenuContact: _contactSectionKey,
    };
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < AppSizes.mobileBreakpoint;

    double navT = (_scrollPosition / 100).clamp(0, 1);

    double startWidth = screenWidth * (isMobile ? 0.95 : 0.6);

    double endWidth = screenWidth;
    double currentNavWidth = startWidth + (endWidth - startWidth) * navT;
    double currentNavTop = (50 - _scrollPosition).clamp(0, 50);
    double currentRadius = 40 * (1 - navT);
    Color navBgColor = navT > 0.8 ? AppColors.darkBg.withOpacity(0.95) : Colors.transparent;

    double t = (_scrollPosition / AppSizes.scrollAnimEnd).clamp(0, 1);
    Color bgColor = Color.lerp(AppColors.lightBg, AppColors.darkBg, t)!;
    Color textColor = Color.lerp(AppColors.lightText, AppColors.darkText, t)!;
    Color accentColor = Color.lerp(AppColors.primaryNavy, AppColors.primaryBlue, t)!;

    final double mobilePadding = AppSizes.smallSpacing;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? mobilePadding : 0),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: isMobile ? 1.0 : 0.6,
                      child: HeroSection(key: _heroSectionKey, accentColor: accentColor, isMobile: isMobile),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? mobilePadding : 0),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: isMobile ? 1.0 : 0.6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSizes.contentTopSpacing),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: AppSizes.largeSpacing),

                            AboutSection(key: _aboutSectionKey, accentColor: accentColor, textColor: textColor, isMobile: isMobile),
                            TimelineSection(key: _timelineSectionKey, accentColor: accentColor, textColor: textColor,),
                            SkillsSection(key: _skillsSectionKey, accentColor: accentColor, textColor: textColor, isMobile: isMobile),
                            ProjectsSection(key: _projectsSectionKey, accentColor: accentColor, textColor: textColor, isMobile: isMobile),


                            SectionTitle(title: AppStrings.contactTitle, color: accentColor),
                            ContactSection(key: _contactSectionKey, isMobile: isMobile, accentColor: accentColor, textColor: textColor),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          StickyNavBar(
            currentTop: currentNavTop,
            currentWidth: currentNavWidth,
            currentRadius: currentRadius,
            backgroundColor: navBgColor,
            isMobile: isMobile,
            sectionKeys: _sectionKeys,
            scrollToSection: _scrollToSection,
          ),
        ],
      ),
    );
  }
}