import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/exercise/exercise_model/exersise_set.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/workouts/widgets/all_exercises.dart';

import '../../../constants/exercise/exercise_data/exercise_sets.dart';
import '../../auth/widgets/app_feature_text.dart';
import '../../auth/widgets/app_large_text.dart';
import '../widgets/exercise_set_widget.dart';
import '../widgets/recommended_workouts.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  ExerciseType selectedType = ExerciseType.low;
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
                  text: 'Workouts',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const AllExercise(),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: AppFeatureText(
                  text: 'Recomended Workouts',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const RecommendedWorkouts(),
              const SizedBox(
                height: 20,
              ),
              // fat loss
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: AppFeatureText(
                  text: 'Exercises',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              difficultyLevel(),
              const SizedBox(
                height: 10,
              ),
              buildWorkouts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWorkouts() => GestureDetector(
        onHorizontalDragEnd: swipeFunction,
        child: Column(
          children: exerciseSets
              .where((element) => element.exerciseType == selectedType)
              .map(
                (exerciseSet) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ExerciseSetWidget(exerciseSet: exerciseSet)),
              )
              .toList(),
        ),
      );

  Widget difficultyLevel() => Row(
        children: ExerciseType.values.map(
          (type) {
            final name = getExerciseName(type);
            final fontWeight =
                selectedType == type ? FontWeight.bold : FontWeight.normal;
            final fontColor = selectedType == type
                ? GlobalVariables.mainBlack
                : GlobalVariables.lightGrey;

            return Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selectedType = type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: fontWeight,
                          fontSize: 16,
                          color: fontColor),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );

  // swipe functionality
  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity! < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity! > 0 && hasPrevious) {
        final previousType = ExerciseType.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
