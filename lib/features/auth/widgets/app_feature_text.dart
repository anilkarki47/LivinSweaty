import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class AppFeatureText extends StatelessWidget {
  double size;
  String text;
  Color color;
  FontWeight fontWeight;
  AppFeatureText({
    super.key,
    this.size = 24,
    required this.text,
    required this.fontWeight,
    this.color = GlobalVariables.mainBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
