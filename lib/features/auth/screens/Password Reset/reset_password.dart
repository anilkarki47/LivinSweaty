import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../../../../constants/global_variables.dart';
import '../../widgets/app_large_text.dart';

class ResetPassword extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    color: GlobalVariables.lightGrey,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 30),
                AppLargeText(
                  text: "Reset",
                  fontWeight: FontWeight.w700,
                ),
                AppLargeText(
                  text: "Password",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Enter password",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Conform new password",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 50),
                CustomButtom(
                  text: 'Continue',
                  color: GlobalVariables.mainBlack,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
