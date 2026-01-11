import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_text_styles.dart';

class ContactSection extends StatefulWidget {
  final bool isMobile;
  final Color accentColor;
  final Color textColor;

  const ContactSection({
    Key? key,
    required this.isMobile,
    required this.accentColor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactSection> {
  // URL 열기 함수
  Future<void> _launchUrl(String url, {bool newTab = false}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: newTab ? LaunchMode.platformDefault : LaunchMode.platformDefault)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  // 이메일 복사 함수
  void _copyToClipboard(String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // ▼▼▼ [추가] 개별 연락처 항목을 생성하는 헬퍼 위젯 ▼▼▼
  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    IconData? trailingIcon,
  }) {
    // 항목별 공통 디자인 속성
    final BorderRadius itemBorderRadius = BorderRadius.circular(10);
    final Color itemBgColor = Colors.white.withOpacity(0.08); // 은은한 배경색
    final Color itemIconColor = AppColors.primaryNavy; // 일관된 아이콘 색상 (예: 인디고 -> 네이비)

    return InkWell(
      onTap: onTap,
      borderRadius: itemBorderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: itemBgColor,
          borderRadius: itemBorderRadius,
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.memoAppColor, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.contactCardBodyText.copyWith(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: AppTextStyles.contactCardBodyText.copyWith(color: AppColors.darkText.withOpacity(0.7))), // darkText 활용
                ],
              ),
            ),
            if (trailingIcon != null) //
              Icon(trailingIcon, color: AppColors.darkText.withOpacity(0.5), size: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
        border: Border.all(color: widget.accentColor.withOpacity(0.3)), // accentColor 활용
      ),
      child: Column(
        children: [
          // 이메일
          _buildContactItem(
            icon: Icons.email_outlined,
            title: "Email",
            subtitle: AppStrings.email,
            onTap: () => _copyToClipboard(AppStrings.email, '이메일이 복사되었습니다.'),
            trailingIcon: Icons.copy, // 복사 아이콘
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.darkText),
          const SizedBox(height: 20),

          // 전화번호
          _buildContactItem(
            icon: Icons.phone_iphone,
            title: "Phone",
            subtitle: AppStrings.phone,
            onTap: widget.isMobile
                ? () => _launchUrl('tel:${AppStrings.phone}')
                : null, // PC에서는 동작 없음
          ),
          const SizedBox(height: 20),
          const Divider(color: AppColors.darkText),
          const SizedBox(height: 20),

          // GitHub
          _buildContactItem(
            icon: Icons.link,
            title: "Github",
            subtitle: AppStrings.github,
            onTap: () => _launchUrl(AppStrings.github, newTab: true),
          ),
        ],
      ),
    );
  }
}
