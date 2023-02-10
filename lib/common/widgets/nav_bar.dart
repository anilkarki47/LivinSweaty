import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/home/screens/home_screen.dart';

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
    const Center(child: Text("Meal")),
    const Center(child: Text("Workout")),
    const Center(child: Text("Favourite")),
    const Center(child: Text("Progress")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.midBlackGrey,
        unselectedItemColor: GlobalVariables.lightGrey,
        backgroundColor: GlobalVariables.offWhite,
        iconSize: 28,
        onTap: updatePage,
        items: const [
          // home
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          // meal
          BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank_outlined,
              ),
              label: 'Meal'),
          // workouts
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_gymnastics,
              ),
              label: 'Workout'),
          //favorite
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favourite'),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Progress'),
        ],
      ),
    );
  }
}
