import 'package:flutter/material.dart';
import 'package:jihun_flutter_resume/widgets/sections/skill/section_widgets/skill_progress_bar.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../common/custom_widgets.dart';
import 'section_widgets/skill_detail_display.dart';

class SkillsSection extends StatefulWidget {
  final Color accentColor;
  final Color textColor;
  final bool isMobile;

  const SkillsSection({
    Key? key,
    required this.accentColor,
    required this.textColor,
    required this.isMobile,
  }) : super(key: key);

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String _selectedSkillName = "";
  String _selectedSkillDescription = "";
  String? _selectedSkillImage;

  // AppStrings.skillData를 참조합니다.
  final List<Map<String, dynamic>> _skillData = AppStrings.skillData;

  @override
  void initState() {
    super.initState();
    if (_skillData.isNotEmpty) {
      _selectedSkillName = _skillData[0]["name"] as String;
      _selectedSkillDescription = _skillData[0]["description"] as String;
      _selectedSkillImage = _skillData[0]["imagePath"] as String?;
    }
  }

  void _onSkillBarTapped(String skillName, String description, String? imagePath) {
    setState(() {
      _selectedSkillName = skillName;
      _selectedSkillDescription = description;
      _selectedSkillImage = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool currentIsMobile = widget.isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: AppStrings.skillsTitle, color: widget.accentColor),

        currentIsMobile
            ? Column(
          children: [
            // ▼▼▼ [핵심 수정 부분] 모바일: 스킬바 목록 GridView로 2열 배치 ▼▼▼
            GridView.builder(
              shrinkWrap: true, // 내용물 크기에 맞춰 GridView 크기 조절
              physics: const NeverScrollableScrollPhysics(), // GridView 자체 스크롤 방지
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 줄에 2개
                crossAxisSpacing: 10.0, // 아이템 간 가로 간격
                mainAxisSpacing: 10.0, // 아이템 간 세로 간격
                childAspectRatio: 2.0, // 아이템의 가로:세로 비율 (스킬바 길이에 맞춰 조절)
              ),
              itemCount: _skillData.length,
              itemBuilder: (context, index) {
                final skill = _skillData[index];
                return SkillProgressBar(
                  skillName: skill["name"] as String,
                  percentage: skill["percentage"] as double,
                  accentColor: widget.accentColor,
                  textColor: widget.textColor,
                  imagePath: skill["imagePath"] as String?,
                  onTap: () => _onSkillBarTapped(
                    skill["name"] as String,
                    skill["description"] as String,
                    skill["imagePath"] as String?,
                  ),
                );
              },
            ),
            // ▲▲▲ 수정 끝 ▲▲▲

            const SizedBox(height: AppSizes.mediumSpacing), // 스킬바 목록과 설명 사이 간격

            // [하단] 선택된 스킬에 대한 텍스트 설명 (모바일에서는 SkillDetailDisplay 사용)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: SizedBox(
                width: double.infinity,
                child: SkillDetailDisplay(
                  key: ValueKey(_selectedSkillName),
                  skillName: _selectedSkillName,
                  skillDescription: _selectedSkillDescription,
                  skillImage: _selectedSkillImage,
                  accentColor: widget.accentColor,
                  textColor: widget.textColor,
                  isMobile: currentIsMobile,
                ),
              ),
            ),
          ],
        )
            : Row( // PC: 스킬바 목록과 설명이 가로로 나란히 (기존 코드와 동일)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [왼쪽] 스킬 프로그레스 바 목록
            Expanded(
              flex: 1,
              child: Column(
                children: _skillData.map((skill) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SkillProgressBar(
                    skillName: skill["name"] as String,
                    percentage: skill["percentage"] as double,
                    accentColor: widget.accentColor,
                    textColor: widget.textColor,
                    imagePath: skill["imagePath"] as String?,
                    onTap: () => _onSkillBarTapped(
                      skill["name"] as String,
                      skill["description"] as String,
                      skill["imagePath"] as String?,
                    ),
                  ),
                )).toList(),
              ),
            ),

            const SizedBox(width: AppSizes.largeSpacing),

            // [오른쪽] 선택된 스킬에 대한 텍스트 설명 (PC)
            Expanded(
              flex: 1,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: SizedBox(
                  width: double.infinity,
                  child: SkillDetailDisplay(
                    key: ValueKey(_selectedSkillName),
                    skillName: _selectedSkillName,
                    skillDescription: _selectedSkillDescription,
                    skillImage: _selectedSkillImage,
                    accentColor: widget.accentColor,
                    textColor: widget.textColor,
                    isMobile: currentIsMobile,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.sectionSpacing),
      ],
    );
  }
}
