import "package:flutter/material.dart";

import "../../../../Core/AppFonts.dart";

class ProfileStatColumn extends StatelessWidget {
  const ProfileStatColumn({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Text(title, style: AppFonts.fontDefaultMainColorBold),
          Text(content, style: AppFonts.fontDefaultMainColorBold),
        ],
      ),
    );
  }
}
