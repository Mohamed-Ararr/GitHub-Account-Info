import "package:flutter/material.dart";

import '../Constants.dart';
import 'FollowCard.dart';

class FollowListview extends StatelessWidget {
  const FollowListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll15,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const FollowCard();
          }),
    );
  }
}
