import "package:flutter/material.dart";
import "package:githubaccount/Core/AppColors.dart";
import "package:githubaccount/Core/AppRouter.dart";

main() {
  runApp(const DevHub());
}

class DevHub extends StatelessWidget {
  const DevHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "JetBrains Mono",
        canvasColor: AppColors.mainColor,
      ),
    );
  }
}
