import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/nav_bar.dart';
import '../../../providers/user_provider.dart';
import '../login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ],
      ),
      duration: 200,
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: GlobalVariables.mainBlack,
      nextScreen: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const Login(),
    );
  }
}

