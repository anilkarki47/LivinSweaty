import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/auth/widgets/app_feature_text.dart';
import 'package:livin_sweaty/features/auth/widgets/app_large_text.dart';
import 'package:livin_sweaty/features/meal/widgets/recommended_diets.dart';

import '../widgets/favourite_meals.dart';
import '../widgets/meal_catagory.dart';

class Meal extends StatelessWidget {
  const Meal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: AppLargeText(
                text: 'Meals',
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const MealCatogery(),
            //
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: AppFeatureText(
                text: 'Recomended Diets',
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const RecommendedDiets(),
            // water intake
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFeatureText(
                    text: 'Water',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: GlobalVariables.midBlackGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                            text: "   Water Intake",
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        AppFeatureText(
                          text: "    0/12 glasses",
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

//
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: AppFeatureText(
                text: 'Favourites',
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const FavouriteMeal(),
            const SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
