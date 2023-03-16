import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/single_item.dart';
import 'package:livin_sweaty/features/admin/screens/admin_screens/workout_screens/add_workout_screen.dart';
import 'package:livin_sweaty/features/admin/services/admin_services.dart';

import '../../../../../common/widgets/loader.dart';
import '../../../../../models/workout.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // List<Workout>? workouts;
  // final AdminServices adminServices = AdminServices();
  @override
  // void initState() {
  //   super.initState();
  //   fetchAllWorkouts();
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

  // void navigateToAddWorkout() {
  //   Navigator.pushNamed(context, AddWorkoutScreen.routeName);
  // }

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
              // onPressed: navigateToAddWorkout,
              onPressed: () {},
              tooltip: "Add Meals",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}
