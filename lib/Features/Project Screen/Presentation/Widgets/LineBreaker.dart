import "package:flutter/material.dart";

import "../../../../Core/AppColors.dart";

class LineBreaker extends StatelessWidget {
  const LineBreaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: 2,
      color: AppColors.greyColor,
    );
  }
}
