import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/auth/widgets/app_feature_text.dart';
import 'package:livin_sweaty/features/auth/widgets/app_large_text.dart';
import 'package:livin_sweaty/features/meal/screens/user_meal_detail.dart';
import 'package:livin_sweaty/features/meal/services/meal_services.dart';
import 'package:livin_sweaty/features/meal/widgets/recommended_diets.dart';

import '../widgets/favourite_meals.dart';
import '../widgets/meal_category.dart';
import 'aa.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  AllMealServices allMealServices = AllMealServices();

  addWaterIntake() {
    allMealServices.addWaterIntake(context: context, waterIntake: waterIntake);
  }

  int waterIntake = 0;

  void waterIncrement() {
    if (waterIntake >= 12) {
      setState(() {
        waterIntake = 12;
      });
    } else {
      setState(() {
        waterIntake += 1;
      });
    }
  }

  void waterDecrement() {
    if (waterIntake <= 0) {
      setState(() {
        waterIntake = 0;
      });
    } else {
      setState(() {
        waterIntake -= 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(days: 1), () {
    //   addWaterIntake();
    // });
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
            const MealCategery(),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WaterIntakePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: GlobalVariables.midBlackGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                  text: "Water Intake",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              AppFeatureText(
                                fontWeight: FontWeight.normal,
                                text: "$waterIntake/12 glasses",
                                color: Colors.white,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  waterIncrement();
                                  addWaterIntake();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: const ImageIcon(
                                    AssetImage("assets/icons/plus.png"),
                                    size: 30,
                                    color: GlobalVariables.mainBlack,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  waterDecrement();
                                  addWaterIntake();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: const ImageIcon(
                                    size: 30,
                                    AssetImage("assets/icons/minus.png"),
                                    color: GlobalVariables.mainBlack,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(),
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
