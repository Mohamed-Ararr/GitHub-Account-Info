import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:githubaccount/Core/Failure.dart';

import '../../Repos/HomeRepoImpl.dart';

part 'languages_state.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit(this.homeRepoImpl) : super(LanguagesInitial());

  final HomeRepoImpl homeRepoImpl;

  fetchTechUsed(String endPoint) async {
    emit(LanguagesLoading());
    Either<Failure, Map<String, dynamic>> result =
        await homeRepoImpl.fetchTechUsed(endPoint);

    result.fold(
      (failure) => emit(LanguagesFailure(failure.errorMsg)),
      (success) => emit(LanguagesSuccess(success)),
    );
  }
}
