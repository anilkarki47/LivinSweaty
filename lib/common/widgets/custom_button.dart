import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;
  const CustomButtom(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.color,
      required this.textColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 80),
        backgroundColor: color,
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      child: AppText(
        fontWeight: FontWeight.w400,
        text: text,
        color: textColor,
      ),
    );
  }
}
