import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/meal/screens/meal_list.dart';

import '../../../constants/global_variables.dart';
import '../../auth/widgets/app_large_text.dart';

class MealCategery extends StatelessWidget {
  const MealCategery({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.7,
        padding: EdgeInsets.symmetric(horizontal: size.width / 20 - 5.6),
        mainAxisSpacing: size.width / 30,
        scrollDirection: Axis.horizontal,
        children: [
          // elements here!
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MealList()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: GlobalVariables.midBlackGrey,
              ),
              child: Center(
                child: AppLargeText(
                  text: "Vegan",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                text: "Non Veg",
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
                text: "Diet",
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
