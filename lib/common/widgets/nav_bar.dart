import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/home/screens/home_screen.dart';
import 'package:livin_sweaty/features/meal/screens/main_meal_page.dart';
import 'package:livin_sweaty/features/workouts/screens/workouts.dart';

import '../../features/progress/screens/progress_page.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const Meal(),
    const Workout(),
    const Center(child: Text("Favourite")),
    // const Center(child: Text("Progress")),
    const ProgressPage(),
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
          // home
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/home.png"),
            ),
            label: 'Home',
          ),
          // meal
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/food.png"),
              ),
              label: 'Meal'),
          // workouts
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/gym.png"),
              ),
              label: 'Workout'),
          //favorite
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/favourite.png"),
              ),
              label: 'Favourite'),

          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/progress.png"),
              ),
              label: 'Progress'),
        ],
      ),
    );
  }
}
