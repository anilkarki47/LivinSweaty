import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/workouts/screens/exercise_vid_page.dart';

import '../../../constants/exercise/exercise_model/exersise_set.dart';
import '../../../constants/global_variables.dart';

class ExerciseSetWidget extends StatelessWidget {
  final ExerciseSet exerciseSet;

  const ExerciseSetWidget({
    super.key,
    required this.exerciseSet,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ExercisePage(exerciseSet: exerciseSet),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 120,
          decoration: BoxDecoration(
            color: GlobalVariables.offWhite,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 3.0,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(flex: 3, child: buildText()),
              Expanded(child: Image.asset(exerciseSet.imageUrl))
            ],
          ),
        ),
      );

  Widget buildText() {
    final exercises = exerciseSet.exercises.length;
    final minutes = exerciseSet.totalDuration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          exerciseSet.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const SizedBox(height: 7),
        Text('$exercises Exercises'),
        const SizedBox(height: 5),
        Text('$minutes Mins'),
      ],
    );
  }
}
