import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/nav_bar.dart';
import 'package:livin_sweaty/features/admin/screens/admin_screens/workout_screens/add_workout_screen.dart';
import 'package:livin_sweaty/features/home/screens/home_screen.dart';

import 'features/admin/screens/admin_screens/meal_screens/add_meal_screen.dart';
import 'features/meal/screens/meal_category_list.dart';
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
    case AddMealScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddMealScreen(),
      );

    case WorkoutCategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WorkoutCategoryScreen(
          category: category,
        ),
      );

    case MealCategoryList.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MealCategoryList(
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
