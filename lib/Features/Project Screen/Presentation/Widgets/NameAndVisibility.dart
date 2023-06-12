import "package:flutter/material.dart";

class NameAndVisibility extends StatelessWidget {
  const NameAndVisibility({super.key, required this.projectName});

  final String projectName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(projectName),
    );
  }
}
