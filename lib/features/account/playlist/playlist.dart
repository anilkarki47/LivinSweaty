import 'package:flutter/material.dart';

class Workout {
  final String name;
  final String description;
  final int duration;

  Workout(
      {required this.name, required this.description, required this.duration});
}

List<Workout> allWorkouts = [
  Workout(
      name: 'Push-ups',
      description: 'A classic exercise for building upper body strength',
      duration: 30),
  Workout(
      name: 'Squats',
      description: 'Great for working the lower body',
      duration: 45),
  Workout(
      name: 'Sit-ups',
      description: 'A simple exercise for strengthening the abs',
      duration: 20),
  Workout(
      name: 'Jumping jacks',
      description: 'An effective exercise for cardiovascular health',
      duration: 60),
  Workout(
      name: 'Lunges',
      description:
          'A great exercise for building lower body strength and endurance',
      duration: 60),
];

class WorkoutListScreen extends StatefulWidget {
  const WorkoutListScreen({super.key});

  @override
  _WorkoutListScreenState createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  List<Workout> selectedWorkouts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Workouts'),
      ),
      body: ListView.builder(
        itemCount: allWorkouts.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(allWorkouts[index].name),
            subtitle: Text(allWorkouts[index].description),
            value: selectedWorkouts.contains(allWorkouts[index]),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  selectedWorkouts.add(allWorkouts[index]);
                } else {
                  selectedWorkouts.remove(allWorkouts[index]);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.playlist_play),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PlaylistScreen(selectedWorkouts: selectedWorkouts),
            ),
          );
        },
      ),
    );
  }
}

class PlaylistScreen extends StatefulWidget {
  final List<Workout> selectedWorkouts;

  const PlaylistScreen({super.key, required this.selectedWorkouts});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlist'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedWorkouts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.selectedWorkouts[index].name),
            subtitle:
                Text('${widget.selectedWorkouts[index].duration} seconds'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.selectedWorkouts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
