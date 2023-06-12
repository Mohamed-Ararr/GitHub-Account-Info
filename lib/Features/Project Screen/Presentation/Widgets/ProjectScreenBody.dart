import "package:flutter/material.dart";
import "package:githubaccount/Constants.dart";
import "package:githubaccount/Core/AppFonts.dart";
import "package:githubaccount/Data/Models/repo_model/repo_model.dart";
import "package:githubaccount/Features/Project%20Screen/Presentation/Widgets/ProjectInforamtion.dart";

class ProjectScreenBody extends StatelessWidget {
  const ProjectScreenBody({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repository", style: AppFonts.font18),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kPaddingLR15,
          child: ProjectInformation(repo: repo),
        ),
      ),
    );
  }
}
