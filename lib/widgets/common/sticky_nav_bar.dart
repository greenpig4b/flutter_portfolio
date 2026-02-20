import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_text_styles.dart';

class StickyNavBar extends StatelessWidget {
  final double currentTop;
  final double currentWidth;
  final double currentRadius;
  final Color backgroundColor;
  final bool isMobile;
  final Map<String, GlobalKey> sectionKeys;
  final void Function(GlobalKey) scrollToSection;

  const StickyNavBar({
    Key? key,
    required this.currentTop,
    required this.currentWidth,
    required this.currentRadius,
    required this.backgroundColor,
    required this.isMobile,
    required this.sectionKeys,
    required this.scrollToSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTransparent = backgroundColor.opacity == 0;
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: currentTop,
      left: 0,
      right: 0,
      // ✨ 핵심 변경 사항: Center 대신 Align을 사용하고, Alignment.center로 정렬
      // Align은 Positioned가 주는 전체 공간 내에서 자식을 정렬합니다.
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: currentWidth.clamp(0, screenWidth), // currentWidth가 screenWidth를 넘지 않도록 강제
          height: 80,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(currentRadius),
                topRight: Radius.circular(currentRadius),
                bottomLeft: Radius.circular(isTransparent ? currentRadius : 0),
                bottomRight: Radius.circular(isTransparent ? currentRadius : 0),
              ),
            ),
            child: Padding(
              // ✨ Padding을 더 보수적으로 설정: AppSizes.smallSpacing을 직접 사용
              padding: EdgeInsets.symmetric(horizontal: isMobile ? AppSizes.smallSpacing : AppSizes.mediumSpacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.appTitle,
                      style: AppTextStyles.navButtonTextStyle.copyWith(fontSize: 30),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: AppStrings.navMenuItems.map((menuItem) {
                            GlobalKey? keyToScroll = sectionKeys[menuItem];

                            return TextButton(
                              onPressed: keyToScroll != null ? () => scrollToSection(keyToScroll) : null,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                textStyle: AppTextStyles.navButtonTextStyle.copyWith(fontSize: 16),
                                overlayColor: Colors.white.withOpacity(0.1),
                              ),
                              child: Text(menuItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}