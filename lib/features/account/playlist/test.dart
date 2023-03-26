import 'package:flutter/material.dart';

class Workout {
  final String name;
  final String description;

  Workout({required this.name, required this.description});
}

class MyPlaylists extends StatefulWidget {
  const MyPlaylists({super.key});

  @override
  _MyPlaylistsState createState() => _MyPlaylistsState();
}

class _MyPlaylistsState extends State<MyPlaylists> {
  List<Workout> allWorkouts = [
    Workout(name: 'Push-ups', description: 'Do 10 push-ups'),
    Workout(name: 'Sit-ups', description: 'Do 20 sit-ups'),
    Workout(name: 'Squats', description: 'Do 15 squats'),
    // add more workouts here
  ];

  Map<String, List<Workout>> myPlaylists = {};

  TextEditingController playlistNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlists'),
      ),
      body: Column(
        children: [
          TextField(
            controller: playlistNameController,
            decoration: InputDecoration(
              labelText: 'Playlist Name',
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    myPlaylists[playlistNameController.text] = [];
                    playlistNameController.clear();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allWorkouts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(allWorkouts[index].name),
                  subtitle: Text(allWorkouts[index].description),
                  trailing: DropdownButton<String>(
                    hint: const Text('Add to Playlist'),
                    onChanged: (String? playlistName) {
                      if (playlistName != null) {
                        setState(() {
                          myPlaylists[playlistName]!.add(allWorkouts[index]);
                        });
                      }
                    },
                    items: myPlaylists.keys.map((String playlistName) {
                      return DropdownMenuItem<String>(
                        value: playlistName,
                        child: Text(playlistName),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          const Text('My Playlists', style: TextStyle(fontSize: 18)),
          Expanded(
            child: ListView.builder(
              itemCount: myPlaylists.keys.length,
              itemBuilder: (context, index) {
                String playlistName = myPlaylists.keys.elementAt(index);
                return ExpansionTile(
                  title: Text(playlistName),
                  children: myPlaylists[playlistName]!.map((Workout workout) {
                    return ListTile(
                      title: Text(workout.name),
                      subtitle: Text(workout.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            myPlaylists[playlistName]!.remove(workout);
                          });
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
