import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/workouts/screens/all_exercise/screens/workout_category_screen.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  void navigateToWorkoutCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, WorkoutCategoryScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          itemExtent: 245,
          itemCount: GlobalVariables.workoutCategory.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => navigateToWorkoutCategoryPage(context,
                      GlobalVariables.workoutCategory[index]['title']!),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 225,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            GlobalVariables.workoutCategory[index]['image']!,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                      // color: Colors.blueAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 160.0,
                        left: 15,
                      ),
                      child: Text(
                        GlobalVariables.workoutCategory[index]['title']!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
