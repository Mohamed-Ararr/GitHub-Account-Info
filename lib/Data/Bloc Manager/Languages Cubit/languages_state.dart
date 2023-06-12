part of 'languages_cubit.dart';

abstract class LanguagesState extends Equatable {
  const LanguagesState();

  @override
  List<Object> get props => [];
}

class LanguagesInitial extends LanguagesState {}

class LanguagesLoading extends LanguagesState {}

class LanguagesSuccess extends LanguagesState {
  final Map<String, dynamic> languages;

  const LanguagesSuccess(this.languages);
}

class LanguagesFailure extends LanguagesState {
  final String error;

  const LanguagesFailure(this.error);
}
