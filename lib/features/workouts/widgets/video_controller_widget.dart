import 'dart:async';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import '../../../constants/exercise/exercise_model/exersise_set.dart';
import '../../../constants/exercise/exercise_model/model_exercise.dart';

class VideoControlsWidget extends StatefulWidget {
  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  final List<Exercise> exercises;

  const VideoControlsWidget({
    Key? key,
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
    required this.exercises,
  }) : super(key: key);

  @override
  VideoControlsWidgetState createState() => VideoControlsWidgetState();
}

class VideoControlsWidgetState extends State<VideoControlsWidget> {
  Timer? _exerciseTimer;
  Timer? _restTimer;
  int _remainingTime = 0;
  bool _isRest = false;
  bool _isExerciseFinished = false;

  late ExerciseSet exerciseSet;

  @override
  void initState() {
    super.initState();
    _startExerciseTimer();
  }

  @override
  void dispose() {
    _exerciseTimer?.cancel();
    _restTimer?.cancel();
    super.dispose();
  }

  void _startExerciseTimer() {
    _exerciseTimer?.cancel(); // Cancel the previous timer

    _remainingTime = widget.exercise.duration.inSeconds;
    _isRest = false;

    _exerciseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!widget.exercise.controller.value.isPlaying) {
        return;
      }

      setState(() {
        _remainingTime -= 1;
      });

      if (_remainingTime <= 0) {
        timer.cancel();
        _startRestTimer();
      }
    });
  }

  void _startRestTimer() {
    _restTimer?.cancel(); // Cancel the previous timer

    _remainingTime = 5;
    _isRest = true;
    widget.onTogglePlaying(false);

    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime -= 1;
      });

      if (_remainingTime <= 0) {
        timer.cancel();
        if (isLastExercise()) {
          _isExerciseFinished = true;
          widget.onTogglePlaying(false);
          setState(() {});
        } else {
          widget.onTogglePlaying(true);
          widget.onNextVideo();
          _startExerciseTimer();
        }
      }
    });
  }

  bool isLastExercise() {
    // Check if the current exercise is the last one in the list
    return widget.exercise == widget.exercises.last;
  }

  void restartExerciseAndRestTimers() {
    _exerciseTimer?.cancel();
    _restTimer?.cancel();
    _startExerciseTimer();
  }

  @override
  Widget build(BuildContext context) {
    if (_isExerciseFinished) {
      return buildExerciseCompletedUI(context);
    }
    return _isRest
        ? buildRestUI(context)
        : Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.90),
            ),
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildText(
                      title: 'Duration',
                      value: '${widget.exercise.duration.inSeconds} Seconds',
                    ),
                    buildText(
                      title: 'Reps',
                      value: '${widget.exercise.noOfReps} times',
                    ),
                  ],
                ),
                buildButtons(context),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Time Left: $_remainingTime s',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
  }

  Widget buildRestUI(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.90),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Rest Time',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '$_remainingTime s',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              buildPlayButton(context),
            ],
          ),
        ),
      );

  Widget buildExerciseCompletedUI(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.90),
      ),
      child: const Center(
        child: Text(
          'Exercise Completed!',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.fast_rewind,
              color: Colors.black87,
              size: 32,
            ),
            onPressed: widget.onRewindVideo,
          ),
          buildPlayButton(context),
          IconButton(
            icon: const Icon(
              Icons.fast_forward,
              color: Colors.black87,
              size: 32,
            ),
            onPressed: widget.onNextVideo,
          ),
        ],
      );

  Widget buildPlayButton(BuildContext context) {
    final isLoading = !widget.exercise.controller.value.isInitialized;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.exercise.controller.value.isPlaying) {
      return buildButton(
        context,
        icon: const Icon(Icons.pause, size: 30, color: Colors.white),
        onClicked: () => widget.onTogglePlaying(false),
      );
    } else {
      return buildButton(
        context,
        icon: const Icon(Icons.play_arrow, size: 30, color: Colors.white),
        onClicked: () => widget.onTogglePlaying(true),
      );
    }
  }

  Widget buildButton(
    BuildContext context, {
    required Widget icon,
    required VoidCallback onClicked,
  }) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: GlobalVariables.lightGrey,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: GlobalVariables.mainBlack,
            child: icon,
          ),
        ),
      );
}
