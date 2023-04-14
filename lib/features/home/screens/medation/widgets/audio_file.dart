import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';

import '../../../../../models/meditation.dart';
import '../../../../auth/widgets/app_large_text.dart';

class AudioFile extends StatefulWidget {
  final List<Meditation> meditations;
  final String imgUrls;

  const AudioFile({
    Key? key,
    required this.meditations,
    required this.imgUrls,
  }) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    // listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    // listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

// getter for audios
  List<String> get audioUrls =>
      widget.meditations.map((meditation) => meditation.link).toList();
      
// getter for images
  List<String> get imgUrls => GlobalVariables.medationImage
      .map((meditationImage) => meditationImage['image'] as String)
      .toList();

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.setSourceUrl(audioUrls[currentIndex]);
  }

  void previousAudio() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      setAudio();
      if (isPlaying) {
        audioPlayer.resume();
      }
    }
  }

  void nextAudio() {
    if (currentIndex < audioUrls.length - 1) {
      setState(() {
        currentIndex++;
      });
      setAudio();
      if (isPlaying) {
        audioPlayer.resume();
      }
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Meditation Player"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(.13),
                ),
                height: 400,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imgUrls,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AppLargeText(
                text: widget.meditations[currentIndex].name,
                fontWeight: FontWeight.bold,
                color: GlobalVariables.mainBlack,
              ),
              const SizedBox(
                height: 3,
              ),
              AppText(
                text: widget.meditations[currentIndex].artist,
                fontWeight: FontWeight.normal,
                color: GlobalVariables.lightGrey,
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  // play and pause
                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.skip_previous),
                    onPressed: previousAudio,
                  ),
                  CircleAvatar(
                    backgroundColor: GlobalVariables.mainBlack,
                    radius: 30,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    iconSize: 40,
                    onPressed: nextAudio,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
