import "package:flutter/material.dart";

import "../../../../Core/AppFonts.dart";

class ProjectTitleAndContent extends StatelessWidget {
  const ProjectTitleAndContent(
      {super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.font12Grey,
        ),
        const SizedBox(height: 5),
        Text(content, style: AppFonts.font18),
      ],
    );
  }
}
