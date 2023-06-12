import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubaccount/Core/ApiService.dart';
import 'package:githubaccount/Data/Bloc%20Manager/Repos%20Cubit/repos_cubit.dart';
import 'package:githubaccount/Data/Bloc%20Manager/User%20Cubit/user_cubit.dart';
import 'package:githubaccount/Data/Repos/HomeRepoImpl.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/HomeScreen.dart';
import 'package:githubaccount/Features/Login%20Screen/Presentation/LoginScreen.dart';
import 'package:githubaccount/Features/Project%20Screen/Presentation/ProjectScreen.dart';
import 'package:githubaccount/Features/Splash%20Screen/Presentation/SplashScreen.dart';
import 'package:go_router/go_router.dart';

import '../Data/Models/repo_model/repo_model.dart';
import '../Data/Models/user_model.dart';

class AppRouter {
  static String loginScreen = "/LoginScreen";
  static String homeScreen = "/HomeScreen";
  static String projectScreen = "/ProjectScreen";
  static String followersScreen = "/followersScreen";
  static String followingScreen = "/followingScreen";

  static final routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(
              create: (context) => UserCubit(HomeRepoImpl(ApiService(Dio()))),
            ),
            BlocProvider<ReposCubit>(
              create: (context) => ReposCubit(HomeRepoImpl(ApiService(Dio()))),
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) =>
            HomeScreen(user: state.extra as UserModel?),
      ),
      GoRoute(
        path: projectScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ReposCubit(HomeRepoImpl(ApiService(Dio()))),
          child: ProjectScreen(repo: state.extra as RepoModel),
        ),
      ),
    ],
  );
}
