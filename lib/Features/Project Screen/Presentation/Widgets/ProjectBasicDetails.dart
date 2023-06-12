import "package:flutter/material.dart";

import "NameAndVisibility.dart";
import "StarsAndForks.dart";

class ProjectBasicDetails extends StatelessWidget {
  const ProjectBasicDetails(
      {super.key,
      required this.projectName,
      this.stars,
      this.forks,
      this.visibility});

  final String projectName;
  final int? stars;
  final int? forks;
  final String? visibility;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        NameAndVisibility(projectName: projectName),
        const SizedBox(height: 10),
        StarsAndForks(stars: stars, forks: forks, visibility: visibility),
      ],
    );
  }
}
