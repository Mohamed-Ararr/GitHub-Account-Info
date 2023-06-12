import "package:flutter/material.dart";
import "package:githubaccount/Data/Models/repo_model/repo_model.dart";

import "Widgets/ProjectScreenBody.dart";

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return ProjectScreenBody(repo: repo);
  }
}
