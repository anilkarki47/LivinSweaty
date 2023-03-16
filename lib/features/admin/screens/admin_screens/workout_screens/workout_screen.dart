import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/single_item.dart';
import 'package:livin_sweaty/features/admin/screens/admin_screens/workout_screens/add_workout_screen.dart';
import 'package:livin_sweaty/features/admin/services/admin_services.dart';

import '../../../../../common/widgets/loader.dart';
import '../../../../../models/workout.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Workout>? workouts;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllWorkouts();
  }

  fetchAllWorkouts() async {
    workouts = await adminServices.fetchAllWorkouts(context);
    setState(() {});
  }

  void deleteWorkout(Workout workout, int index) {
    adminServices.deleteWorkout(
      context: context,
      workout: workout,
      onSuccess: () {
        workouts!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddWorkout() {
    Navigator.pushNamed(context, AddWorkoutScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return workouts == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: workouts!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final workoutData = workouts![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleItem(
                          image: workoutData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              workoutData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => deleteWorkout(workoutData, index),
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
              onPressed: navigateToAddWorkout,
              tooltip: "Add Workouts",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}
