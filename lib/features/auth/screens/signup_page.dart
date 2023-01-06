import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/screens/login_page.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                const SizedBox(height: 20),
                AppLargeText(
                  text: "Sign Up",
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: "Username",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: _passwordController,
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
                const SizedBox(height: 15),
                Row(
                  children: [
                    AppText(
                      text: "By signing up you're agree to our ",
                      size: 12,
                    ),
                    AppText(
                        text: "Terms & Condition ",
                        size: 12,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                Row(
                  children: [
                    AppText(
                      text: "and",
                      size: 12,
                      color: GlobalVariables.lightGrey,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    AppText(
                        text: "Privacy Policy",
                        size: 12,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                const SizedBox(height: 15),
                CustomButtom(
                  text: 'Continue',
                  color: GlobalVariables.mainBlack,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => 
                        HomePage())),
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "Joined us before?",
                      size: 18,
                      color: GlobalVariables.lightGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                      },
                      child: AppText(
                        text: "Login",
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
