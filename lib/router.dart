import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/nav_bar.dart';
import 'package:livin_sweaty/features/admin/screens/workout_screens/add_workout_screen.dart';
import 'package:livin_sweaty/features/home/screens/home_screen.dart';

import 'features/screens/login_page.dart';
import 'features/workouts/screens/all_exercise/screens/workout_category_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Login.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Login(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    case AddWorkoutScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddWorkoutScreen(),
      );
      
    case WorkoutCategoryScreen.routeName:
    var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WorkoutCategoryScreen(
          category: category,
        ),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text('404 ERROR!')),
        ),
      );
  }
}
