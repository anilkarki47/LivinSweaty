import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/exercise/exercise_model/exersise_set.dart';

import '../../../constants/exercise/exercise_model/model_exercise.dart';
import '../widgets/video_controller_widget.dart';
import '../widgets/video_player_widget.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseSet exerciseSet;
  const ExercisePage({super.key, required this.exerciseSet});

  @override
  State<ExercisePage> createState() => ExercisePageState();
}

class ExercisePageState extends State<ExercisePage> {
  final controller = PageController();
  late Exercise currentExercise;

  @override
  void initState() {
    super.initState();

    currentExercise = widget.exerciseSet.exercises.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(currentExercise.name),
        ),
        body: Stack(children: [
          buildVideos(),
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: buildVideoControls(),
          )
        ]),
      );

  Widget buildVideos() => PageView(
        controller: controller,
        onPageChanged: (index) => setState(() {
          currentExercise = widget.exerciseSet.exercises[index];
        }),
        children: widget.exerciseSet.exercises
            .map((exercise) => VideoPlayerWidget(
                  exercise: exercise,
                  onInitialized: () => setState(() {}),
                ))
            .toList(),
      );

  Widget buildVideoControls() => VideoControlsWidget(
        exercise: currentExercise,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              currentExercise.controller.play();
            } else {
              currentExercise.controller.pause();
            }
          });
        },
        onNextVideo: () => controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        onRewindVideo: () => controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
      );
}
