import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';
import 'package:livin_sweaty/features/home/widgets/workout_desc.dart';

import '../../../constants/global_variables.dart';
import '../../../models/playlist_model.dart';
import '../../plans/screens/services/plan_services.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({super.key});

  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  List<PlaylistModel>? playlistList;
  final PlanServices playlistServices = PlanServices();

  @override
  void initState() {
    super.initState();
    fetchAllPlaylist();
  }

  fetchAllPlaylist() async {
    await playlistServices.fetchAllPlaylist(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout List')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          // final workout = workouts![index];
          // final playlist = playlistNames![index];
          // print(playlist.id);
          return Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            child: Card(
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WorkoutDesc()));
                  },
                  child: const ListTile(
                    // leading: Image.network(
                    //   workout.images[0],
                    //   fit: BoxFit.fitWidth,
                    //   width: 50,
                    // ),
                    title: Text(
                      "workouts![index].name",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: GlobalVariables.mainBlack),
                    ),
                    subtitle: Text("workouts![index].description",
                        overflow: TextOverflow.ellipsis),
                    // trailing: DropdownButton<PlaylistName>(
                    //   hint: const Text(
                    //     'Plans',
                    //     style: TextStyle(fontSize: 14),
                    //   ),
                    //   onChanged: (PlaylistName? playlistName) async {
                    //     if (playlistName != null) {
                    //       // Add the selected workout to the playlist
                    //       final workoutId = workout.id;
                    //       final playlistId = playlist.id;
                    //       addWorkoutToPlaylist(playlistId, workoutId);
                    //     }
                    //   },
                    //   items: playlistNames!.map<DropdownMenuItem<PlaylistName>>(
                    //       (PlaylistName playlistName) {
                    //     return DropdownMenuItem<PlaylistName>(
                    //       value: playlistName,
                    //       child: Text(
                    //         playlistName.name,
                    //         style: const TextStyle(fontSize: 14),
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                  ),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: AppText(
          text: "Start Workout",
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        backgroundColor: GlobalVariables.mainBlack,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
