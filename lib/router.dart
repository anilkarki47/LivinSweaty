import 'package:flutter/material.dart';

import 'features/auth/screens/login_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Login.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Login(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('404 ERROR!')
          ),
        ),
      );
  }
}
