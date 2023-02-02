import 'package:flutter/cupertino.dart';
import 'package:livin_sweaty/constants/error_handling.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:livin_sweaty/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // SIGNUP USER
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User('', name, email, password, '', '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          showSnackBar(
            context,
            "Account created sucessfully! Please login to continue..",
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
