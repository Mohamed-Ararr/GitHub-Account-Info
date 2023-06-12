import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:githubaccount/Data/Repos/HomeRepoImpl.dart';

import '../../../Core/Failure.dart';
import '../../Models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.homeRepoImpl) : super(UserInitial());

  final HomeRepoImpl homeRepoImpl;

  fetchUser(String username) async {
    emit(UserLoading());
    Either<Failure, UserModel> result = await homeRepoImpl.fetchUser(username);

    result.fold(
      (failure) => emit(UserFailure(failure.errorMsg)),
      (success) => emit(UserSuccess(success)),
    );
  }
}
