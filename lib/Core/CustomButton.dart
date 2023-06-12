import "package:flutter/material.dart";
import "package:githubaccount/Constants.dart";

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, this.child, this.backgroundColor});

  final Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: kPaddingTB15,
          shape: RoundedRectangleBorder(
            borderRadius: kbRadius15,
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
