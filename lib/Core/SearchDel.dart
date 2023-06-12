import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:githubaccount/Constants.dart';
import 'package:githubaccount/Core/ApiService.dart';
import 'package:githubaccount/Core/AppColors.dart';
import 'package:githubaccount/Data/Bloc%20Manager/Repos%20Cubit/repos_cubit.dart';
import 'package:githubaccount/Data/Models/repo_model/repo_model.dart';
import 'package:githubaccount/Data/Repos/HomeRepoImpl.dart';
import 'package:go_router/go_router.dart';

import '../Features/Home Screen/Presentation/Widgets/ReposSuccessListview.dart';

class SearchDel extends SearchDelegate {
  final String repoUrl;

  SearchDel(this.repoUrl);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      canvasColor: AppColors.mainColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secColor,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isEmpty ? GoRouter.of(context).pop() : query = "";
        },
        icon: const Icon(FontAwesomeIcons.xmark),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => GoRouter.of(context).pop(),
      icon: const Icon(FontAwesomeIcons.arrowLeft),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReposCubit(HomeRepoImpl(ApiService(Dio())))..fetchRepos(repoUrl),
      child: BlocBuilder<ReposCubit, ReposState>(
        builder: (context, state) {
          if (state is ReposSuccess) {
            List<RepoModel?> suggestation = state.repos.where((repo) {
              final result = repo!.name?.toLowerCase();
              final input = query.toLowerCase();

              return result!.contains(input);
            }).toList();
            return Padding(
              padding: kPaddingLR15,
              child: ReposSuccessListview(
                itemCount: suggestation.length,
                repos: suggestation,
              ),
            );
          } else if (state is ReposFailure) {
            return Center(
              child: Center(child: Text(state.error)),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
