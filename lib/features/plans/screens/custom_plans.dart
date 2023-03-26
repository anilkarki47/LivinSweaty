import 'package:flutter/material.dart';

import '../../../models/workout.dart';
import '../../admin/services/admin_services.dart';

class CustomPlans extends StatefulWidget {
  const CustomPlans({super.key});

  @override
  State<CustomPlans> createState() => _CustomPlansState();
}

class _CustomPlansState extends State<CustomPlans> {
  List<Workout>? workouts;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllWorkouts();
  }

  fetchAllWorkouts() async {
    workouts = await adminServices.fetchAllWorkouts(context);
    setState(() {});
  }
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
              itemCount: workouts!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(workouts![index].name),
                  subtitle: Text(workouts![index].description),
                  trailing: DropdownButton<String>(
                    hint: const Text('Add to Playlist'),
                    onChanged: (String? playlistName) {
                      if (playlistName != null) {
                        setState(() {
                          myPlaylists[playlistName]!.add(workouts![index]);
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
