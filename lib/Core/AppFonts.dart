import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppFonts {
  static TextStyle font25WhiteBold = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20White = const TextStyle(
    fontSize: 20,
  );

  static TextStyle font23 = const TextStyle(
    fontSize: 22,
  );

  static TextStyle font12Grey = TextStyle(
    fontSize: 12,
    color: AppColors.greyColor,
  );

  static TextStyle font13Grey = TextStyle(
    fontSize: 13,
    color: AppColors.greyColor,
  );

  static TextStyle fontDefaultMainColorBold = TextStyle(
    color: AppColors.mainColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font18 = const TextStyle(
    fontSize: 18,
  );

  static TextStyle fontDefaultBlackBold = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
