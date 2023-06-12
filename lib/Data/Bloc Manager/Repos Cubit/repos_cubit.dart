import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:githubaccount/Data/Models/repo_model/repo_model.dart';
import 'package:githubaccount/Data/Repos/HomeRepoImpl.dart';

import '../../../Core/Failure.dart';

part 'repos_state.dart';

class ReposCubit extends Cubit<ReposState> {
  ReposCubit(this.homeRepoImpl) : super(ReposInitial());

  final HomeRepoImpl homeRepoImpl;

  fetchRepos(String url) async {
    try {
      emit(ReposLoading());
      Either<Failure, List<RepoModel?>> result =
          await homeRepoImpl.fetchRepos(url);

      result.fold(
        (failure) => emit(ReposFailure(failure.errorMsg)),
        (success) => emit(ReposSuccess(success)),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
