import 'package:flutter/material.dart';

class AppSlogan extends StatelessWidget {
  const AppSlogan({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Text(
        "Keep track of your github activities",
        textAlign: TextAlign.center,
      ),
    );
  }
}
