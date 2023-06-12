import 'package:flutter/material.dart';
import 'package:githubaccount/Features/Home%20Screen/Presentation/Widgets/HomeScreenBody.dart';

import '../../../Data/Models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.user});

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return HomeScreenBody(user: user);
  }
}
