import 'package:dartz/dartz.dart';
import 'package:githubaccount/Core/Failure.dart';
import 'package:githubaccount/Data/Models/repo_model/repo_model.dart';
import 'package:githubaccount/Data/Models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserModel?>> fetchUser(String username);
  Future<Either<Failure, List<RepoModel?>>> fetchRepos(String endpPoint);
  Future<Either<Failure, Map<String, dynamic>>> fetchTechUsed(String endpPoint);
}
