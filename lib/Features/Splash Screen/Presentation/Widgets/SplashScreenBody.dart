import 'package:flutter/material.dart';
import 'package:githubaccount/Core/AppRouter.dart';
import 'package:githubaccount/Features/Splash%20Screen/Presentation/Widgets/AppSlogan.dart';
import 'package:githubaccount/Features/Splash%20Screen/Presentation/Widgets/LogoTitle.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => GoRouter.of(context).pushReplacement(AppRouter.loginScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Spacer(),
            LogoTitle(),
            Spacer(),
            AppSlogan(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
