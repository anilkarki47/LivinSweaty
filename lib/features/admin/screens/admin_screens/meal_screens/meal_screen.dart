import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/admin/services/admin_services.dart';
import 'package:livin_sweaty/models/meal.dart';

import '../../../../../common/widgets/loader.dart';
import '../../../../../common/widgets/single_item.dart';
import 'add_meal_screen.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal>? meals;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllMeals();
  }

  fetchAllMeals() async {
    meals = await adminServices.fetchAllMeals(context);
    setState(() {});
  }

  // void deleteWorkout(Workout workout, int index) {
  //   adminServices.deleteWorkout(
  //     context: context,
  //     workout: workout,
  //     onSuccess: () {
  //       workouts!.removeAt(index);
  //       setState(() {});
  //     },
  //   );
  // }

  void navigateToAddMeal() {
    Navigator.pushNamed(context, AddMealScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return meals == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: meals!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final mealData = meals![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleItem(
                          image: mealData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              mealData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          IconButton(
                            // onPressed: () => deleteWorkout(workoutData, index),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddMeal,
              tooltip: "Add Meals",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}
