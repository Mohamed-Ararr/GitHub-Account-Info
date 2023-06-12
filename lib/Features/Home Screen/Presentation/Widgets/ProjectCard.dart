import "package:flutter/material.dart";
import "package:githubaccount/Core/AppRouter.dart";
import "package:githubaccount/Data/Models/repo_model/repo_model.dart";
import "package:go_router/go_router.dart";

import "ProjectDetails.dart";
import "ViewDetailsRow.dart";

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.projectScreen, extra: repo);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ProjectDetails(repo: repo),
            const ViewDetailsRow(),
          ],
        ),
      ),
    );
  }
}
