import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/screens/login_page.dart';
import 'package:livin_sweaty/providers/user_provider.dart';
import 'package:livin_sweaty/router.dart';
import 'package:provider/provider.dart';

import 'common/widgets/nav_bar.dart';
import 'features/auth/screens/home/screens/home_screen.dart';
import 'features/auth/services/auth_service.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livin'Sweaty",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const Login(),
    );
  }
}
