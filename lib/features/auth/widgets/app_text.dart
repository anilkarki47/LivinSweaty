import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class AppText extends StatelessWidget {
  double size;
  String text;
  Color color;
  FontWeight fontWeight;
  AppText({
    super.key,
    this.size = 18,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = GlobalVariables.mainBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ));
  }
}
