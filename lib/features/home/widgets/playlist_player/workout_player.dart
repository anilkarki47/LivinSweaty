// import 'dart:async';
// import 'package:flutter/material.dart';

// class ExercisePlayer extends StatefulWidget {
//   final List<Workout> workouts;
//   final int currentIndex;

//   const ExercisePlayer({super.key, this.workouts, this.currentIndex});

//   @override
//   _ExercisePlayerState createState() => _ExercisePlayerState();
// }

// class _ExercisePlayerState extends State<ExercisePlayer> {
//   Timer _timer;
//   int _timeCounter = 0;
//   int _restCounter = 0;
//   int _currentIndex;
//   Workout _currentWorkout;
//   final bool _isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.currentIndex;
//     _currentWorkout = widget.workouts[_currentIndex];
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_timeCounter < _currentWorkout.time) {
//           _timeCounter++;
//         } else {
//           _timeCounter = 0;
//           _restCounter++;
//           if (_restCounter == 30) {
//             _restCounter = 0;
//             _timer.cancel();
//           }
//         }
//       });
//     });
//   }

//   void _pauseTimer() {
//     _timer.cancel();
//   }

//   void _nextWorkout() {
//     if (_currentIndex < widget.workouts.length - 1) {
//       setState(() {
//         _currentIndex++;
//         _currentWorkout = widget.workouts[_currentIndex];
//         _timeCounter = 0;
//         _restCounter = 0;
//         _timer.cancel();
//       });
//     }
//   }

//   void _previousWorkout() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//         _currentWorkout = widget.workouts[_currentIndex];
//         _timeCounter = 0;
//         _restCounter = 0;
//         _timer.cancel();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(playlists[selectedIndex]['images'][0]),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 100,
//             left: 0,
//             right: 0,
//             child: Column(
//               children: [
//                 Text(
//                   playlists[selectedIndex]['name'],
//                   style: const TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   playlists[selectedIndex]['category'],
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: CircularProgressIndicator(
//                     value: counter / totalTime,
//                     valueColor:
//                         const AlwaysStoppedAnimation<Color>(Colors.white),
//                     backgroundColor: Colors.grey[400],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   '$counter sec',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.skip_previous),
//                       onPressed: () {
//                         setState(() {
//                           selectedIndex--;
//                         });
//                       },
//                     ),
//                     // Play/pause button
//                     IconButton(
//                       icon: Icon(
//                         isPlaying ? Icons.pause : Icons.play_arrow,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           isPlaying = !isPlaying;
//                         });
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.skip_next),
//                       onPressed: () {
//                         setState(() {
//                           selectedIndex++;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 //Button here
//                 RaisedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: const Text('Set total time'),
//                           content: TextField(
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               setState(() {
//                                 totalTime = int.parse(value);
//                               });
//                             },
//                             decoration:
//                                 const InputDecoration(hintText: 'In seconds'),
//                           ),
//                           actions: [
//                             FlatButton(
//                               child: const Text('Cancel'),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                             FlatButton(
//                               child: const Text('Set'),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 startTimer();
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: const Text('Set Timer'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
