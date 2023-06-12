import "package:flutter/material.dart";
import "package:githubaccount/Data/Models/repo_model/repo_model.dart";

import "LineBreaker.dart";
import "ProjectBasicDetails.dart";
import "ProjectSpecifics.dart";

class ProjectInformation extends StatelessWidget {
  const ProjectInformation({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectBasicDetails(
          projectName: repo.name!,
          stars: repo.starsCount,
          forks: repo.forksCount,
          visibility: repo.visibility,
        ),
        const SizedBox(height: 20),
        const LineBreaker(),
        const SizedBox(height: 20),
        ProjectSpecifics(repo: repo),
      ],
    );
  }
}
