import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/admin/screens/workout_screens/add_workout_screen.dart';
import 'package:livin_sweaty/features/admin/services/admin_services.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../models/workout.dart';

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

  void navigateToAddWorkout() {
    Navigator.pushNamed(context, AddWorkoutScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return workouts == null
        ? const Loader()
        : Scaffold(
            body: const Center(child: Text("Workouts")),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddWorkout,
              tooltip: "Add Workouts",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
  }
}
