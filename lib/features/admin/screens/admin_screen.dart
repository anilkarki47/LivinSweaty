import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import 'workout_screens/workout_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const WorkoutScreen(),
    const Center(child: Text("Meals")),
    const Center(child: Text("Users")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.mainBlack,
        unselectedItemColor: GlobalVariables.lightGrey,
        backgroundColor: GlobalVariables.offWhite,
        iconSize: 28,
        onTap: updatePage,
        items: const [
          // workouts
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/gym.png"),
              ),
              label: 'Workout'),
          // meal
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/food.png"),
              ),
              label: 'Meal'),

          //users
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/favourite.png"),
              ),
              label: 'Users'),
        ],
      ),
    );
  }
}