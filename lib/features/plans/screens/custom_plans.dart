import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/widgets/app_feature_text.dart';

import '../../../constants/global_variables.dart';
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
              child: ListView.builder(
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
                      trailing: DropdownButton<String>(
                        hint: const Text(
                          'Plans',
                          style: TextStyle(fontSize: 14),
                        ),
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
                    ),
                  );
                },
              ),
            ),
            // const Divider(),
            // const Text('My Playlists', style: TextStyle(fontSize: 18)),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: myPlaylists.keys.length,
            //     itemBuilder: (context, index) {
            //       String playlistName = myPlaylists.keys.elementAt(index);
            //       return ExpansionTile(
            //         title: Text(playlistName),
            //         children: myPlaylists[playlistName]!.map((Workout workout) {
            //           return ListTile(
            //             title: Text(workout.name),
            //             subtitle: Text(workout.description),
            //             trailing: IconButton(
            //               icon: const Icon(Icons.remove),
            //               onPressed: () {
            //                 setState(() {
            //                   myPlaylists[playlistName]!.remove(workout);
            //                 });
            //               },
            //             ),
            //           );
            //         }).toList(),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
