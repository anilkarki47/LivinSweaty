import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/workouts/screens/all_exercise/exercise_list.dart';

class AllExercise extends StatefulWidget {
  const AllExercise({super.key});

  @override
  State<AllExercise> createState() => _AllExerciseState();
}

class _AllExerciseState extends State<AllExercise> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ExerciseList(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 200,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/chest.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
