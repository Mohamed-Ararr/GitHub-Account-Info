import 'package:flutter/material.dart';

import '../../../../Constants.dart';
import '../../../../Core/AppColors.dart';
import '../../../../Core/AppFonts.dart';

class TechUsedTitle extends StatelessWidget {
  const TechUsedTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: kbRadius15,
        color: AppColors.blueColor.withAlpha(100),
      ),
      child: Text(
        title,
        style: AppFonts.font12Grey,
        textAlign: TextAlign.center,
      ),
    );
  }
}
