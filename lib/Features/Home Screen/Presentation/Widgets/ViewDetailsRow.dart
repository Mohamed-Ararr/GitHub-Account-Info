import "package:flutter/material.dart";

import "../../../../Constants.dart";
import "../../../../Core/AppColors.dart";
import "../../../../Core/AppFonts.dart";

class ViewDetailsRow extends StatelessWidget {
  const ViewDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPaddingLR15TB10,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "View details",
            style: AppFonts.fontDefaultBlackBold,
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
