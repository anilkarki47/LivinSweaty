import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/custom_textfield.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/screens/signup_page.dart';
import 'package:livin_sweaty/features/auth/services/auth_service.dart';
import 'package:livin_sweaty/features/auth/widgets/app_large_text.dart';

import '../../common/widgets/custom_button.dart';
import '../auth/widgets/app_text.dart';

class Login extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _loginFormKey = GlobalKey<FormState>();

// BINDING SIGNUP USERS IN SIGNUP UI
final AuthService authService = AuthService();

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

  void loginUser() {
    authService.loginUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/login.gif'),
                              fit: BoxFit.cover)),
                      // color: GlobalVariables.lightGrey,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppLargeText(
                    color: GlobalVariables.mainBlack,
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
                    onTap: () {
                      if (_loginFormKey.currentState!.validate()) {
                        loginUser();
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomButtom(
                    text: 'Create Account',
                    textColor: GlobalVariables.lightGrey,
                    color: Colors.white,
                    borderColor: GlobalVariables.lightGrey,
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp())),
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
        ),
      ),
    );
  }
}
