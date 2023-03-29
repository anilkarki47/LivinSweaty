import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/login_page.dart';

class AccountServices {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        Login.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
