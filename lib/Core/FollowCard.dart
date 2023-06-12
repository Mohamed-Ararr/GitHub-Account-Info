import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../Constants.dart";
import "AppColors.dart";

class FollowCard extends StatelessWidget {
  const FollowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: kPaddingAll15,
      decoration: BoxDecoration(
        color: AppColors.secColor,
        borderRadius: kbRadius15,
      ),
      child: Row(
        children: [
          SvgPicture.asset(avatar),
          const SizedBox(width: 15),
          const Text("Mohamed islam arrar"),
        ],
      ),
    );
  }
}
