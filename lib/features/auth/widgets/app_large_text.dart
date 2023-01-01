import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class AppLargeText extends StatelessWidget {
  double size;
  String text;
  Color color;
  FontWeight fontWeight;
  AppLargeText({
    super.key,
    this.size = 30,
    required this.text,
    required this.fontWeight,
    this.color = GlobalVariables.mainBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: GlobalVariables.mainBlack,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
