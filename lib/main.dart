import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/screens/login_page.dart';
import 'package:livin_sweaty/features/auth/screens/signup_page.dart';
import 'package:livin_sweaty/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livin'Sweaty",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const Login(),
    );
  }
}
