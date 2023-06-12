import 'package:flutter/material.dart';

import '../../../../Core/AppFonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "DevHub",
      style: AppFonts.font23,
    );
  }
}
