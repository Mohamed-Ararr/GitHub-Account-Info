import "package:flutter/material.dart";
import "package:githubaccount/Data/Models/repo_model/repo_model.dart";

import "../../../../Core/AppFonts.dart";
import "ProjectCard.dart";

class ReposSuccessListview extends StatelessWidget {
  const ReposSuccessListview({super.key, this.itemCount, required this.repos});

  final int? itemCount;
  final List<RepoModel?> repos;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text("Repositories(${repos.length})", style: AppFonts.font18),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              repos.sort((a, b) => b!.createdAt!.compareTo(a!.createdAt!));
              return ProjectCard(repo: repos[index]!);
            },
          ),
        ],
      ),
    );
  }
}
