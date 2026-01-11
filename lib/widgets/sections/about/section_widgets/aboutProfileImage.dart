import 'package:flutter/material.dart';

class AboutProfileImage extends StatelessWidget {
  final Color accentColor;
  final double size;

  const AboutProfileImage({
    Key? key,
    required this.accentColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( // 그림자나 테두리를 위해 컨테이너로 감쌈
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: accentColor, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CircleAvatar( // ▼▼▼ [핵심 수정] CircleAvatar 사용 ▼▼▼
        radius: size / 2, // CircleAvatar는 radius를 받음 (지름/2)
        backgroundImage: const AssetImage('assets/images/resume_photo.jpeg'),
        backgroundColor: Colors.transparent, // 이미지 로딩 전 배경색 또는 이미지 없을 때
      ),
    );
  }
}
