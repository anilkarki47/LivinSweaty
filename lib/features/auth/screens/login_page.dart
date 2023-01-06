import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/custom_textfield.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/auth/screens/signup_page.dart';
import 'package:livin_sweaty/features/auth/widgets/app_large_text.dart';

import '../../../common/widgets/custom_button.dart';
import '../widgets/app_text.dart';

class Login extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppLargeText(
                  text: "LOGO",
                  size: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              AppLargeText(
                text: "Login",
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                hintText: "Email ID",
                hintStyle: const TextStyle(
                  fontSize: 18.0,
                  color: GlobalVariables.lightGrey,
                ),
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                hintText: "Password",
                hintStyle: const TextStyle(
                  fontSize: 18.0,
                  color: GlobalVariables.lightGrey,
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 60),
              CustomButtom(
                text: 'Log In',
                color: GlobalVariables.mainBlack,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                onTap: () {},
              ),
              const SizedBox(height: 15),
              CustomButtom(
                text: 'Create Account',
                textColor: GlobalVariables.lightGrey,
                color: Colors.white,
                borderColor: GlobalVariables.lightGrey,
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp())),
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: AppText(
                  text: "Forgot Password?",
                  size: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
