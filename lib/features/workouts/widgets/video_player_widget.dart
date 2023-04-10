import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/exercise/exercise_model/model_exercise.dart';

class VideoPlayerWidget extends StatefulWidget {
  final Exercise exercise;
  final ValueNotifier<bool> isInitialized;

  const VideoPlayerWidget({
    super.key,
    required this.exercise,
    required this.isInitialized,
  });

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? controller;

  @override
void initState() {
  super.initState();
  controller = VideoPlayerController.asset(widget.exercise.videoUrl)
    ..initialize().then((value) {
      setState(() {
        controller?.setLooping(true);
        controller?.play();
      });

      if (controller != null) {
        widget.exercise.controller = controller!;
        widget.isInitialized.value = true;
      }
    });
}

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: controller != null && controller!.value.isInitialized
            ? VideoPlayer(controller!)
            : const Center(child: CircularProgressIndicator()),
      );

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
