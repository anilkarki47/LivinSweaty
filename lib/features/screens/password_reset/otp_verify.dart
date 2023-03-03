import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../../auth/widgets/app_large_text.dart';
import '../../auth/widgets/app_text.dart';


class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

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
                  color: GlobalVariables.mainBlack,
                  text: "Forgot",
                  fontWeight: FontWeight.w700,
                ),
                AppLargeText(
                  color: GlobalVariables.mainBlack,
                  text: "Password?",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 20),
                AppText(
                  text:
                      "Please enter the email ID associated with your account.",
                  size: 12,
                ),
                const SizedBox(height: 20),
                const TextField(),
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
