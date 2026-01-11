import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';


class BouncingArrow extends StatefulWidget {
  const BouncingArrow({Key? key}) : super(key: key);

  @override
  State<BouncingArrow> createState() => _BouncingArrowState();
}

class _BouncingArrowState extends State<BouncingArrow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation; // Offset 타입으로 변경

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    // SlideTransition을 위한 Tween 설정 (0.0 ~ 0.5 만큼 Y축 이동)
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.5), // 아이콘 크기의 50%만큼 움직임
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder 대신 SlideTransition 사용 (성능 최적화)
    return SlideTransition(
      position: _offsetAnimation,
      child: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.darkText.withOpacity(0.6),
        size: 40,
      ),
    );
  }
}
