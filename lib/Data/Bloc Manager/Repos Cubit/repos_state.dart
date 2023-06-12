part of 'repos_cubit.dart';

abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object> get props => [];
}

class ReposInitial extends ReposState {}

class ReposLoading extends ReposState {}

class ReposSuccess extends ReposState {
  final List<RepoModel?> repos;

  const ReposSuccess(this.repos);
}

class ReposFailure extends ReposState {
  final String error;

  const ReposFailure(this.error);
}
