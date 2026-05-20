import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/app_text_styles.dart';


class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String videoPath; // GIF 경로가 들어옴
  final Color accentColor;
  final Color textColor;
  final bool isMobile;
  final String? githubUrl; // 선택 사항
  final String? playStoreUrl; // ✨ 추가: Play Store 링크 (선택 사항)

  const ProjectCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.videoPath,
    required this.accentColor,
    required this.textColor,
    required this.isMobile,
    this.githubUrl,
    this.playStoreUrl, // ✨ 추가
  }) : super(key: key);

  // URL 열기 비동기 함수 - null 체크 추가
  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty) {
      return;
    }
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      // 에러 처리
    }
  }

  // ✨ 추가: 버튼들을 만드는 공통 위젯
  Widget _buildActionButtons() {
    final bool showGithubButton = githubUrl != null && githubUrl!.isNotEmpty;
    final bool showPlayStoreButton = playStoreUrl != null && playStoreUrl!.isNotEmpty;

    if (!showGithubButton && !showPlayStoreButton) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        if (showGithubButton)
          OutlinedButton.icon(
            onPressed: () => _launchUrl(githubUrl),
            icon: const Icon(Icons.code),
            label: const Text("View Github"),
            style: OutlinedButton.styleFrom(
              foregroundColor: accentColor,
              side: BorderSide(color: accentColor),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              textStyle: AppTextStyles.bodyText.copyWith(fontSize: isMobile ? 14 : 16),
            ),
          ),
        if (showPlayStoreButton)
          ElevatedButton.icon(
            onPressed: () => _launchUrl(playStoreUrl),
            icon: const Icon(Icons.android),
            label: const Text("Play Store"),
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              textStyle: AppTextStyles.bodyText.copyWith(fontSize: isMobile ? 14 : 16),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double currentTitleFontSize = isMobile ? 24 : 32;
    double currentSubtitleFontSize = isMobile ? 14 : 16;
    double currentDescriptionFontSize = isMobile ? 14 : AppTextStyles.bodyText.fontSize!;

    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? AppSizes.mediumSpacing : 60),
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(isMobile ? 20 : 30),
        border: Border.all(color: accentColor.withOpacity(0.3)),
      ),
      child: isMobile
          ? Column( // 모바일: 세로 배치
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isMobile ? 15 : 20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isMobile ? 15 : 20),
                child: Image.asset(
                  videoPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: currentSubtitleFontSize,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: currentTitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: AppTextStyles.bodyText.copyWith(
                  color: textColor.withOpacity(0.8),
                  height: 1.6,
                  fontSize: currentDescriptionFontSize,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildActionButtons(), // ✨ 수정: 공통 위젯 사용
            ],
          ),
        ],
      )
          : Row( // PC: 가로 배치
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    videoPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: currentSubtitleFontSize,
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: currentTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: AppTextStyles.bodyText.copyWith(
                    color: textColor.withOpacity(0.8),
                    height: 1.6,
                    fontSize: currentDescriptionFontSize,
                  ),
                ),
                const SizedBox(height: 30),
                _buildActionButtons(), // ✨ 수정: 공통 위젯 사용
              ],
            ),
          ),
        ],
      ),
    );
  }
}