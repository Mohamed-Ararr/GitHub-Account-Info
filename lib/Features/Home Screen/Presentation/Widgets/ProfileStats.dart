import "package:flutter/material.dart";
import "package:githubaccount/Features/Home%20Screen/Presentation/Widgets/ProfileStatTitle.dart";

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key, this.followers, this.following});

  final int? followers;
  final int? following;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProfileStatColumn(
          title: "Followers",
          content: "${followers ?? "Not Available"}",
        ),
        ProfileStatColumn(
          title: "Following",
          content: "${following ?? "Not Available"}",
        ),
      ],
    );
  }
}
