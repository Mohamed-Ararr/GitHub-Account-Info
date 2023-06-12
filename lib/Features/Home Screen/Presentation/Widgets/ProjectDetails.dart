import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:githubaccount/Data/Models/repo_model/repo_model.dart";

import "../../../../Constants.dart";
import "../../../../Core/AppColors.dart";

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPaddingAll15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.secColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(FontAwesomeIcons.github, size: 35),
          ),
          const SizedBox(height: 8),
          Text("${repo.id ?? "Not Available"}"),
          const SizedBox(height: 8),
          Text(repo.name ?? "Not Available"),
          const SizedBox(height: 8),
          Text("Created: ${repo.createdAt?.split("T")[0] ?? "Not Available"}"),
        ],
      ),
    );
  }
}
