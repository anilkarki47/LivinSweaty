import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 42;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.midBlackGrey,
        unselectedItemColor: GlobalVariables.lightGrey,
        backgroundColor: GlobalVariables.offWhite,
        iconSize: 28,
        items: [
          // home
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.midBlackGrey
                          : GlobalVariables.offWhite,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.home_outlined,
                ),
              ),
              label: 'Home'),
          // meal
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.midBlackGrey
                          : GlobalVariables.offWhite,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.food_bank_outlined,
                ),
              ),
              label: 'Meal'),
          // workouts
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.midBlackGrey
                          : GlobalVariables.offWhite,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.sports_gymnastics,
                ),
              ),
              label: ''),
          //favorite
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 0
                          ? GlobalVariables.midBlackGrey
                          : GlobalVariables.offWhite,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.favorite,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
