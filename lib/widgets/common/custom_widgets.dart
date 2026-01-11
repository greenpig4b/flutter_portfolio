import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';


// 1. 섹션 제목 위젯
class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;

  const SectionTitle({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40.0),
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 5)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: color,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

// 2. 본문 텍스트 위젯
class ContentText extends StatelessWidget {
  final String text;
  final Color textColor;

  const ContentText({Key? key, required this.text, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        height: 1.8,
        color: textColor.withOpacity(0.9),
      ),
    );
  }
}



// 4. Hover Skill Chip (애니메이션 칩)
class HoverSkillChip extends StatefulWidget {
  final String label;
  final Color textColor;
  final Color accentColor;

  const HoverSkillChip({
    Key? key,
    required this.label,
    required this.textColor,
    required this.accentColor
  }) : super(key: key);

  @override
  State<HoverSkillChip> createState() => _HoverSkillChipState();
}

class _HoverSkillChipState extends State<HoverSkillChip> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        transform: _isHovering ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovering ? widget.accentColor : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: _isHovering ? widget.accentColor : widget.textColor.withOpacity(0.3)
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 16,
            color: _isHovering ? Colors.white : widget.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// 5. Hover Project Card (애니메이션 카드)
class HoverProjectCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final IconData icon;

  const HoverProjectCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  State<HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<HoverProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(30),
        transform: _isHovering ? Matrix4.translationValues(0, -10, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: _isHovering
              ? Border.all(color: widget.color.withOpacity(0.5), width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          boxShadow: [
            BoxShadow(
              color: _isHovering ? widget.color.withOpacity(0.4) : Colors.black.withOpacity(0.2),
              blurRadius: _isHovering ? 25 : 15,
              offset: _isHovering ? const Offset(0, 15) : const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: widget.color, size: 32),
                const SizedBox(width: 15),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    color: widget.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 17, height: 1.6, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
