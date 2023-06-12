import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubaccount/Core/AppRouter.dart';
import 'package:githubaccount/Core/CustomButton.dart';
import 'package:githubaccount/Data/Bloc%20Manager/Repos%20Cubit/repos_cubit.dart';
import 'package:githubaccount/Data/Bloc%20Manager/User%20Cubit/user_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../Constants.dart';
import '../../../../Core/AppColors.dart';
import '../../../../Core/CircularProgressSmall.dart';
import '../../../../Core/CustomTextField.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String? username;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  responseFunction(String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error Occured"),
            content: Text(error),
            actions: [
              ElevatedButton(
                onPressed: () => GoRouter.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redColor,
                ),
                child: Text(
                  "Re-try",
                  style: TextStyle(color: AppColors.greyColor),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kPaddingLR15,
          child: Form(
            key: key,
            autovalidateMode: autovalidateMode,
            child: CustomTextField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserFailure) {
              debugPrint('operation failed, ${state.error}');
              responseFunction(state.error);
            }

            if (state is UserSuccess) {
              debugPrint('operation success, ${state.toString()}');
              debugPrint(state.user.reposUrl!);
              BlocProvider.of<ReposCubit>(context)
                  .fetchRepos(state.user.reposUrl!);
              GoRouter.of(context)
                  .pushReplacement(AppRouter.homeScreen, extra: state.user);
            }
          },
          builder: (context, state) {
            return CustomButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  BlocProvider.of<UserCubit>(context).fetchUser(username ?? "");
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: AppColors.greenColor,
              child: state is UserLoading
                  ? const CircularProgressSmall()
                  : const Text("Login"),
            );
          },
        ),
      ],
    );
  }
}
