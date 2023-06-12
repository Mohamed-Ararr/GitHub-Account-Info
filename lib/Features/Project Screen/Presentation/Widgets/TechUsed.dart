import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubaccount/Data/Bloc%20Manager/Languages%20Cubit/languages_cubit.dart';
import 'package:githubaccount/Data/Models/repo_model/repo_model.dart';

import '../../../../Core/AppFonts.dart';
import '../../../../Core/CircularProgress.dart';
import 'TechUsedTitle.dart';

class TechUsed extends StatelessWidget {
  const TechUsed({super.key, required this.repo});

  final RepoModel repo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tech Used",
          style: AppFonts.font12Grey,
        ),
        const SizedBox(height: 5),
        BlocBuilder<LanguagesCubit, LanguagesState>(
          builder: (context, state) {
            if (state is LanguagesSuccess) {
              if (state.languages.isEmpty) {
                return const Center(child: Text("Not Available"));
              } else {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.languages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    List<String> techList = state.languages.keys.toList();
                    return TechUsedTitle(title: techList[index]);
                  },
                );
              }
            } else if (state is LanguagesFailure) {
              return Center(child: Text(state.error));
            } else {
              return const CustomCircularIndicator();
            }
          },
        ),
      ],
    );
  }
}
