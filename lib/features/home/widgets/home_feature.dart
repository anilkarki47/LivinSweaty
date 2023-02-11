import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/widgets/app_large_text.dart';

import '../../../constants/global_variables.dart';

class HomeFeature extends StatelessWidget {
  const HomeFeature({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.4,
        padding: EdgeInsets.symmetric(horizontal: size.width / 20 - 5.6),
        mainAxisSpacing: size.width / 30,
        scrollDirection: Axis.horizontal,
        children: [
          // elements here!
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
            child: Center(
              child: AppLargeText(
                text: "BMI Calculator",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
            child: Center(
              child: AppLargeText(
                text: "Medation",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
            child: Center(
              child: AppLargeText(
                text: "BMI Calculator",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}