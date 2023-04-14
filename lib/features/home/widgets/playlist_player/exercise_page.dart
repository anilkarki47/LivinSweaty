import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class GifPlayer extends StatefulWidget {
  final List<String> gifs;
  final List<String> workoutName;
  final int initialIndex;

  const GifPlayer(
      {Key? key,
      required this.gifs,
      required this.initialIndex,
      required this.workoutName})
      : super(key: key);

  @override
  GifPlayerState createState() => GifPlayerState();
}

class GifPlayerState extends State<GifPlayer> {
  late int currentIndex;
  bool isPlaying = false;
  int counter = 20;
  int restCounter = 10;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    startTimer();
  }

  void previousGif() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex -= 1;
        counter = 20;
      });
    }
  }

  void nextGif() {
    if (currentIndex < widget.gifs.length - 1) {
      setState(() {
        currentIndex += 1;
        counter = 20;
      });
    }
  }

  void stopTimer() {
    timer.cancel();
    setState(() {
      isPlaying = false;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter -= 1;
        });
      } else if (restCounter > 0) {
        setState(() {
          restCounter -= 1;
        });
      } else {
        if (currentIndex < widget.gifs.length - 1) {
          nextGif();
          counter = 20;
          restCounter = 10;
        } else {
          stopTimer();
        }
      }
    });
  }

  void togglePlayPause() {
    if (timer.isActive) {
      stopTimer();
    } else {
      startTimer();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  Widget restTimer() {
    return Text(
      'Rest for $restCounter seconds',
      style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  Widget exerciseCompleted() {
    return const Text(
      'Exercise completed!',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workoutName[currentIndex]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 450,
            width: 500,
            child: CachedNetworkImage(
              imageUrl: widget.gifs[currentIndex],
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: GlobalVariables.mainBlack,
                ),
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (counter == 0 &&
                        restCounter > 0 &&
                        currentIndex < widget.gifs.length - 1)
                      restTimer()
                    else if (counter > 0 ||
                        currentIndex < widget.gifs.length - 1)
                      Text(
                        'Timer : $counter sec',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    else
                      exerciseCompleted(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.fast_rewind,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: previousGif,
                        ),
                        IconButton(
                          icon: Icon(
                            isPlaying ? Icons.play_arrow : Icons.pause,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: togglePlayPause,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: nextGif,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
