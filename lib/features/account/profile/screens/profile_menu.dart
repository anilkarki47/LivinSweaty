import 'package:flutter/material.dart';

import '../../../../constants/global_variables.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: GlobalVariables.offWhite,
              borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          child: ListTile(
            title: Text(text),
            leading: icon,
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        //
      ],
    );
  }
}
