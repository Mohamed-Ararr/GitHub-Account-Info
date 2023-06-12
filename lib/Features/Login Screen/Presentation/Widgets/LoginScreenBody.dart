import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githubaccount/Constants.dart';
import 'package:githubaccount/Features/Login%20Screen/Presentation/Widgets/FormInput.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * .20),
            const Spacer(),
            SvgPicture.asset(appLogo),
            const SizedBox(height: 30),
            const FormInput(),
            // SizedBox(height: MediaQuery.of(context).size.height * .20),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
