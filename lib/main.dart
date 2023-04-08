import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/screens/splash_screen/splash.dart';
import 'package:livin_sweaty/providers/user_provider.dart';
import 'package:livin_sweaty/router.dart';
import 'package:provider/provider.dart';

import 'features/auth/services/auth_service.dart';
import 'notificationservice/local_notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

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
      debugShowCheckedModeBanner: false,
      title: "Livin'Sweaty",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: GlobalVariables.mainBlack,
          secondary: GlobalVariables.mainBlack,
        ),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const SplashScreen(),
    );
  }
}
