import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubaccount/Constants.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/Widgets/AppBarTitle.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/Widgets/CustomDrawer.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/Widgets/CustomDrawerButton.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/Widgets/CustomSearchButton.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/Widgets/ProjectsListview.dart';

import '../../../../Core/ApiService.dart';
import '../../../../Core/SearchDel.dart';
import '../../../../Data/Bloc Manager/Repos Cubit/repos_cubit.dart';
import '../../../../Data/Models/user_model.dart';
import '../../../../Data/Repos/HomeRepoImpl.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, this.user});

  final UserModel? user;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const AppBarTitle(),
        centerTitle: true,
        leading: CustomDrawerButton(
          onPressed: () => key.currentState!.openDrawer(),
        ),
        actions: [
          CustomSearchButton(
            onTap: () => showSearch(
                context: context, delegate: SearchDel(widget.user!.reposUrl!)),
          ),
        ],
      ),
      drawer: CustomDrawer(user: widget.user!),
      body: SafeArea(
        child: Padding(
          padding: kPaddingLR15,
          child: BlocProvider(
            create: (context) => ReposCubit(HomeRepoImpl(ApiService(Dio())))
              ..fetchRepos(widget.user!.reposUrl!),
            child: ProjectsListview(user: widget.user),
          ),
        ),
      ),
    );
  }
}
