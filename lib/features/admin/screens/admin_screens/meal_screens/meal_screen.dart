import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/admin/services/admin_services.dart';
import 'package:livin_sweaty/models/meal.dart';

import 'add_meal_screen.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal>? meals;
  final AdminServices adminServices = AdminServices();
  // @override
  // void initState() {
  //   super.initState();
  //   // fetchAllMeals();
  // }

  // fetchAllWorkouts() async {
  //   workouts = await adminServices.fetchAllWorkouts(context);
  //   setState(() {});
  // }

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
    return
        // workouts == null
        //     ? const Loader()
        //     :
        Scaffold(
            body: GridView.builder(
                // itemCount: workouts!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  // final workoutData = workouts![index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 140,
                        // child: SingleItem(
                        //   image: workoutData.images[0],
                        // ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Meal",
                              // workoutData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
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
              // onPressed: () {},
              tooltip: "Add Meals",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}
