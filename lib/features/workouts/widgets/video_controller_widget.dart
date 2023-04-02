import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

import '../../../constants/exercise/exercise_model/model_exercise.dart';

class VideoControlsWidget extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  const VideoControlsWidget({
    super.key,
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.90),
        ),
        height: 142,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildText(
                  title: 'Duration',
                  value: '${exercise.duration.inSeconds} Seconds',
                ),
                buildText(
                  title: 'Reps',
                  value: '${exercise.noOfReps} times',
                ),
              ],
            ),
            buildButtons(context),
          ],
        ),
      );

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
            onPressed: onRewindVideo,
          ),
          buildPlayButton(context),
          IconButton(
            icon: const Icon(
              Icons.fast_forward,
              color: Colors.black87,
              size: 32,
            ),
            onPressed: onNextVideo,
          ),
        ],
      );

  Widget buildPlayButton(BuildContext context) {
    final isLoading = !exercise.controller.value.isInitialized;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (exercise.controller.value.isPlaying) {
      return buildButton(
        context,
        icon: const Icon(Icons.pause, size: 30, color: Colors.white),
        onClicked: () => onTogglePlaying(false),
      );
    } else {
      return buildButton(
        context,
        icon: const Icon(Icons.play_arrow, size: 30, color: Colors.white),
        onClicked: () => onTogglePlaying(true),
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
