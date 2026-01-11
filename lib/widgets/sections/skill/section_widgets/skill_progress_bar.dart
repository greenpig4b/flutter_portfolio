import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../constants/app_text_styles.dart';


class SkillProgressBar extends StatefulWidget {
  final String skillName;
  final double percentage;
  final Color accentColor;
  final Color textColor;
  final VoidCallback onTap; // ▼▼▼ [추가] 탭 이벤트 콜백 ▼▼▼

  const SkillProgressBar({
    Key? key,
    required this.skillName,
    required this.percentage,
    required this.accentColor,
    required this.textColor,
    required this.onTap, String? imagePath,
  }) : super(key: key);

  @override
  State<SkillProgressBar> createState() => _SkillProgressBarState();
}

class _SkillProgressBarState extends State<SkillProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimatedOnce = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0.0, end: widget.percentage).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.5 && !_hasAnimatedOnce) {
      _controller.forward();
      _hasAnimatedOnce = true;
    } else if (info.visibleFraction == 0 && _hasAnimatedOnce) {
      _controller.reset();
      _hasAnimatedOnce = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.skillName),
      onVisibilityChanged: _onVisibilityChanged,
      // ▼▼▼ [수정] InkWell 추가 (탭 감지 및 시각적 피드백) ▼▼▼
      child: InkWell(
        onTap: widget.onTap, // 부모로부터 받은 onTap 함수 호출
        borderRadius: BorderRadius.circular(6), // 프로그레스 바와 동일한 둥근 모서리
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0), // 터치 영역 확장
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.skillName,
                style: AppTextStyles.bodyText.copyWith(color: widget.textColor),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        widthFactor: _animation.value,
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: widget.accentColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${(widget.percentage * 100).toInt()}%',
                  style: AppTextStyles.bodyText.copyWith(
                    color: widget.textColor.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ▲▲▲ [수정 끝] ▲▲▲
    );
  }
}
