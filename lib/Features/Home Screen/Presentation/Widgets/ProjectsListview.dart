import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:githubaccount/Data/Bloc%20Manager/Repos%20Cubit/repos_cubit.dart";
import "package:githubaccount/Features/Home%20Screen/Presentation/Widgets/ReposSuccessListview.dart";

import "../../../../Data/Models/user_model.dart";

class ProjectsListview extends StatelessWidget {
  const ProjectsListview({super.key, this.user});

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReposCubit, ReposState>(
      builder: (context, state) {
        if (state is ReposSuccess) {
          return ReposSuccessListview(
            itemCount: state.repos.length,
            repos: state.repos,
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
    );
  }
}
