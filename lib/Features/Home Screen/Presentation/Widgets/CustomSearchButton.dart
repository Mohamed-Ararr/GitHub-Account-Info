import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: kbRadius15,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SvgPicture.asset(search),
      ),
    );
  }
}
