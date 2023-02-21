import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle hintStyle;
  final Widget prefixIcon;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hintStyle,
    this.maxLines = 1,
    this.prefixIcon = const Icon(Icons.add),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.lightGrey,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.lightGrey,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
