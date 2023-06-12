import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubaccount/Data/Models/user_model.dart';
import 'package:githubaccount/Data/Models/repo_model/repo_model.dart';
import 'package:githubaccount/Core/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:githubaccount/Data/Repos/HomeRepo.dart';

import '../../Core/ApiService.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<RepoModel?>>> fetchRepos(String url) async {
    try {
      List<dynamic> data = await apiService.fetchRepos(url: url);

      List<RepoModel?> repos = data
          .map((item) {
            if (item is Map<String, dynamic>) {
              return RepoModel(
                id: item["id"] ?? "Not available",
                name: item["name"] ?? "Not available",
                description: item["description"] ?? "Not available",
                createdAt: item["created_at"] ?? "Not available",
                updatedAt: item["updated_at"] ?? "Not available",
                pushedAt: item["pushed_at"] ?? "Not available",
                forksCount: item["forks_count"] ?? "Not available",
                languagesUrl: item["languages_url"] ?? "Not available",
                starsCount: item["stargazers_count"] ?? "Not available",
                visibility: item["visibility"] ?? "Not available",
              );
            } else {
              return null;
            }
          })
          .where((repo) => repo != null)
          .toList();

      debugPrint("${repos.length}");
      return Right(repos);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserModel>> fetchUser(String username) async {
    try {
      Map<String, dynamic> data =
          await apiService.fetchUser(githubUsername: username);
      UserModel user = UserModel(
        avatarUrl: data["avatar_url"],
        bio: data["bio"],
        createdAt: data["create_at"],
        followers: data["followers"],
        following: data["following"],
        followersUrl: data["followers_url"],
        followingUrl: data["following_url"],
        id: data["id"],
        login: data["login"],
        name: data["name"],
        reposUrl: data["repos_url"],
        updatedAt: data["updated_at"],
      );

      return Right(user);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchTechUsed(
      String endPoint) async {
    try {
      Map<String, dynamic> langauges =
          await apiService.fetchTechUsed(endPoint: endPoint);
      debugPrint("$langauges");
      return Right(langauges);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
