import 'package:flutter/material.dart';

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
    required this.color,
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
