import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/admin/screens/workout_screens/add_workout_screen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  void navigateToAddWorkout() {
    Navigator.pushNamed(context, AddWorkoutScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(child: Text("Workouts")),
        floatingActionButton: FloatingActionButton(
          onPressed: navigateToAddWorkout,
          tooltip: "Add Workouts",
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
