import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/widgets/app_feature_text.dart';
import 'package:livin_sweaty/features/plans/screens/services/plan_services.dart';
import 'package:livin_sweaty/models/playlist_name.dart';

import '../../../constants/global_variables.dart';
import '../../../models/workout.dart';
import '../../admin/services/admin_services.dart';

class CustomPlans extends StatefulWidget {
  const CustomPlans({Key? key}) : super(key: key);

  @override
  State<CustomPlans> createState() => _CustomPlansState();
}

class _CustomPlansState extends State<CustomPlans> {
  final AdminServices adminServices = AdminServices();
  final PlanServices allPlanServices = PlanServices();

  TextEditingController playlistNameController = TextEditingController();

  List<Workout>? workouts;
  List<PlaylistName>? playlistNames;
  Map<String, List<Workout>> myPlaylists = {};

  @override
  void dispose() {
    super.dispose();
    playlistNameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchAllWorkouts();
    fetchAllPlaylistName();
  }

  fetchAllWorkouts() async {
    workouts = await adminServices.fetchAllWorkouts(context);
    setState(() {});
  }

  fetchAllPlaylistName() async {
    playlistNames = await allPlanServices.fetchAllPlaylistName(context);
    setState(() {});
  }

  addPlaylistName() {
    allPlanServices.addPlaylistName(
        context: context, playlistName: playlistNameController.text);
  }

  addWorkoutToPlaylist(String? playlistId, String? workoutId) {
    if (playlistId != null && workoutId != null) {
      allPlanServices.addWorkoutToPlaylist(
        context: context,
        playlistId: playlistId,
        workoutId: workoutId,
      );
    } else {
      // print("aaaaa");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Plans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: playlistNameController,
              decoration: InputDecoration(
                hintText: "Enter plan name",
                hintStyle: const TextStyle(
                  fontSize: 18.0,
                  color: GlobalVariables.lightGrey,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  iconSize: 30,
                  onPressed: () {
                    addPlaylistName();
                    setState(() {
                      myPlaylists[playlistNameController.text] = [];
                      playlistNameController.clear();
                    });
                  },
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: GlobalVariables.lightGrey,
                  ),
                ),
              ),
            ),
            //
            const SizedBox(
              height: 20,
            ),
            AppFeatureText(text: "All Workouts", fontWeight: FontWeight.w600),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: workouts == null || playlistNames == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: workouts!.length,
                      itemBuilder: (context, index) {
                        final workout = workouts![index];

                        return Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                              workout.images[0],
                              fit: BoxFit.fitWidth,
                              width: 50,
                            ),
                            title: Text(
                              workouts![index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: GlobalVariables.mainBlack),
                            ),
                            subtitle: Text(workouts![index].description,
                                overflow: TextOverflow.ellipsis),
                            trailing: DropdownButton<PlaylistName>(
                              hint: const Text(
                                'Plans',
                                style: TextStyle(fontSize: 14),
                              ),
                              onChanged: (PlaylistName? playlistName) async {
                                if (playlistName != null) {
                                  // Add the selected workout to the playlist
                                  final workoutId = workout.id;
                                  final playlistId = playlistName.id;
                                  addWorkoutToPlaylist(playlistId, workoutId);
                                }
                              },
                              items: playlistNames!
                                  .map<DropdownMenuItem<PlaylistName>>(
                                      (PlaylistName playlistName) {
                                return DropdownMenuItem<PlaylistName>(
                                  value: playlistName,
                                  child: Text(
                                    playlistName.name,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
