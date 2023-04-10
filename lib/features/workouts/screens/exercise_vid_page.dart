import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/exercise/exercise_model/exersise_set.dart';

import '../../../constants/exercise/exercise_model/model_exercise.dart';
import '../widgets/video_controller_widget.dart';
import '../widgets/video_player_widget.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseSet exerciseSet;
  const ExercisePage({Key? key, required this.exerciseSet}) : super(key: key);

  @override
  State<ExercisePage> createState() => ExercisePageState();
}


class ExercisePageState extends State<ExercisePage> {
  final controller = PageController();
  late Exercise currentExercise;
  final GlobalKey<VideoControlsWidgetState> videoControlsKey = GlobalKey();

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
        key: videoControlsKey,
        exercise: currentExercise,
        exercises: widget.exerciseSet.exercises,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              currentExercise.controller.play();
            } else {
              currentExercise.controller.pause();
            }
          });
        },
        onNextVideo: () {
          controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
          videoControlsKey.currentState
              ?.restartExerciseAndRestTimers(); 
        },
        onRewindVideo: () {
          controller.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
          videoControlsKey.currentState
              ?.restartExerciseAndRestTimers();
        },
      );
}
