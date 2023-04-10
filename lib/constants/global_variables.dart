import 'package:flutter/material.dart';

// String uri = 'http://10.0.2.2:3000';
// iic
// String uri = 'http://192.168.43.71:3000';
// home
// String uri = 'http://192.168.100.215:3000';
String uri = 'http://192.168.100.142:3000';

// String uri = 'http://0.0.0.0/0';

class GlobalVariables {
  // COLORS
  static const Color mainBlack = Color(0xFF0D0D0D);
  static const Color midBlackGrey = Color(0xFF444444);
  static const Color lightGrey = Color(0xFF8C8C8C);
  static const Color offWhite = Color(0xFFF2F2F2);

// workout category
  static const List<Map<String, String>> workoutCategory = [
    {
      'title': 'Chest',
      'image': 'assets/images/workout_category/chest.png',
    },
    {
      'title': 'Back',
      'image': 'assets/images/workout_category/back.png',
    },
    {
      'title': 'Shoulders',
      'image': 'assets/images/workout_category/shoulder.png',
    },
    {
      'title': 'Biceps',
      'image': 'assets/images/workout_category/bicep.png',
    },
    {
      'title': 'Triceps',
      'image': 'assets/images/workout_category/tricep.png',
    },
    {
      'title': 'Legs',
      'image': 'assets/images/workout_category/leg.png',
    },
    {
      'title': 'Abs',
      'image': 'assets/images/workout_category/abs.png',
    },
  ];

  // meal category
  static const List<Map<String, String>> mealCategory = [
    {
      'title': 'Vegan',
      // 'image': 'assets/images/workout_category/chest.png',
    },
    {
      'title': 'Non-Veg',
      // 'image': 'assets/images/workout_category/back.png',
    },
  ];
}
