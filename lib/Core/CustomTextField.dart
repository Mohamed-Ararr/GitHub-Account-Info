import 'package:flutter/material.dart';

import '../Constants.dart';
import 'AppColors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onSaved, this.onChanged});

  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Input required. Fill it, please!";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      cursorColor: AppColors.greenColor,
      decoration: InputDecoration(
        label: const Text(
          "Username",
          style: TextStyle(color: Colors.white),
        ),
        hintText: "Enter your username",
        border: OutlineInputBorder(
          borderRadius: kbRadius15,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: kbRadius15,
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
          borderRadius: kbRadius15,
          borderSide: BorderSide(
            color: AppColors.greenColor,
          ),
        ),
      ),
    );
  }
}
