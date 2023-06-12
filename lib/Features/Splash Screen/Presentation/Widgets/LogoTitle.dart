import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants.dart';
import '../../../../Core/AppFonts.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(appLogo),
        Text("DevHub", style: AppFonts.font25WhiteBold),
      ],
    );
  }
}
