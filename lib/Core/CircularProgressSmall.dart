import 'package:flutter/material.dart';

import 'AppColors.dart';

class CircularProgressSmall extends StatelessWidget {
  const CircularProgressSmall({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 3.5,
        color: AppColors.mainColor,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
