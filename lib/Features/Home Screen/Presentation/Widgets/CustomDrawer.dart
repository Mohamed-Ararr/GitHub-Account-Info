import "package:flutter/material.dart";
import "package:githubaccount/Core/AppRouter.dart";
import "package:go_router/go_router.dart";

import "../../../../Core/AppColors.dart";
import "../../../../Core/CustomButton.dart";
import "../../../../Data/Models/user_model.dart";
import "BioText.dart";
import "ProfileStats.dart";
import "UserContainer.dart";

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.greyColor,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            UserContainer(
              avatarUrl: user.avatarUrl!,
              name: user.name,
              login: user.login,
            ),
            const SizedBox(height: 20),
            BioText(bio: user.bio),
            const SizedBox(height: 20),
            ProfileStats(followers: user.followers, following: user.following),
            const Spacer(),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.loginScreen);
              },
              backgroundColor: AppColors.redColor,
              child: const Text("Logout"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
