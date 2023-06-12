import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubaccount/Core/ApiService.dart';
import 'package:githubaccount/Data/Bloc%20Manager/Languages%20Cubit/languages_cubit.dart';
import 'package:githubaccount/Data/Models/repo_model/repo_model.dart';
import 'package:githubaccount/Data/Repos/HomeRepoImpl.dart';

import 'ProjectTitleAndContent.dart';
import 'TechUsed.dart';

class ProjectSpecifics extends StatelessWidget {
  const ProjectSpecifics({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguagesCubit(HomeRepoImpl(ApiService(Dio())))
        ..fetchTechUsed(repo.languagesUrl!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectTitleAndContent(
            title: "ID",
            content: "${repo.id}",
          ),
          const SizedBox(height: 20),
          ProjectTitleAndContent(
            title: "Description",
            content: repo.description ?? "Unavailable",
          ),
          const SizedBox(height: 20),
          ProjectTitleAndContent(
            title: "Created At",
            content: repo.createdAt!.split("T")[0],
          ),
          const SizedBox(height: 20),
          ProjectTitleAndContent(
            title: "Updated At",
            content: repo.updatedAt!.split("T")[0],
          ),
          const SizedBox(height: 20),
          ProjectTitleAndContent(
            title: "Pushed At",
            content: repo.pushedAt!.split("T")[0],
          ),
          const SizedBox(height: 20),
          TechUsed(repo: repo),
        ],
      ),
    );
  }
}
