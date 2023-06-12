import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import "../../../../Constants.dart";
import "../../../../Core/AppFonts.dart";

class StarsAndForks extends StatelessWidget {
  const StarsAndForks({super.key, this.stars, this.forks, this.visibility});

  final int? stars;
  final int? forks;
  final String? visibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          decoration: BoxDecoration(
            borderRadius: kbRadius15,
            color: Colors.white.withAlpha(50),
          ),
          child: Text(visibility ?? "Unavailable", style: AppFonts.font12Grey),
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            const Icon(FontAwesomeIcons.star, size: 16),
            const SizedBox(width: 5),
            Text("${stars ?? 0}"),
            const SizedBox(width: 5),
            const Text("Star(s)"),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            const Icon(FontAwesomeIcons.codeFork, size: 16),
            const SizedBox(width: 5),
            Text("${forks ?? 0}"),
            const SizedBox(width: 5),
            const Text("Fork(s)"),
          ],
        ),
      ],
    );
  }
}
