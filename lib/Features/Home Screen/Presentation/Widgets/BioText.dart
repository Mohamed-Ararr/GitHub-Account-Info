import 'package:flutter/material.dart';
import 'package:githubaccount/Core/AppColors.dart';

import '../../../../Core/AppFonts.dart';

class BioText extends StatelessWidget {
  const BioText({super.key, this.bio});

  final String? bio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text("Bio",
              style: AppFonts.font13Grey.copyWith(color: AppColors.mainColor)),
          const SizedBox(height: 5),
          Text(
            bio ?? "Not Available",
            style: AppFonts.fontDefaultMainColorBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
