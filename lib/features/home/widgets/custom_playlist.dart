import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livin_sweaty/features/home/widgets/playlist_player/exercise_page.dart';
import 'package:livin_sweaty/features/home/widgets/workout_desc.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';
import '../../auth/widgets/app_text.dart';

class CustomPlaylist extends StatefulWidget {
  const CustomPlaylist({super.key});

  @override
  CustomPlaylistState createState() => CustomPlaylistState();
}

class CustomPlaylistState extends State<CustomPlaylist> {
  List<dynamic> playlists = [];

  @override
  void initState() {
    super.initState();
    _fetchWorkouts();
  }

  Future<void> _fetchWorkouts() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final response = await http.get(
        Uri.parse('$uri/auth/get-playlists'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          playlists = data['data'];
        });
      } else {
        throw Exception('Failed to fetch workouts');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void _moveUp(int index) {
    if (index > 0) {
      setState(() {
        final item = playlists[index];
        playlists[index] = playlists[index - 1];
        playlists[index - 1] = item;
      });
    }
  }

  void _moveDown(int index) {
    if (index < playlists.length - 1) {
      setState(() {
        final item = playlists[index];
        playlists[index] = playlists[index + 1];
        playlists[index + 1] = item;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(playlists);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: playlists.length,
        itemBuilder: (BuildContext context, int index) {
          final playlist = playlists[index]['workoutID'];
          return Container(
            height: 100,

            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 1.5), // changes position of shadow
                )
              ],
              color: Colors.white,
            ),
            // sets height to 120 pixels

            child: Center(
              child: ListTile(
                leading: Transform.scale(
                  scale: 1.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.network(
                      playlist['images'][0],
                    ),
                  ),
                ),
                title: Transform.scale(
                  scale: 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 3),
                    child: Text(playlist['name']),
                  ),
                ),
                subtitle: Transform.scale(
                  scale: 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 3),
                    child: Text(playlist['category']),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutDesc(
                        playlist: playlists[index],
                      ),
                    ),
                  );
                },
                trailing: SizedBox(
                  // color: Colors.red,
                  height: double.infinity,
                  width: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => _moveUp(index),
                        child: const ImageIcon(
                          AssetImage("assets/images/up-arrow.png"),
                          size: 23,
                          color: GlobalVariables.lightGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => _moveDown(index),
                        child: const ImageIcon(
                          AssetImage("assets/images/down-arrow.png"),
                          size: 23,
                          color: GlobalVariables.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List<String> gifUrls = playlists
              .map<String>((p) => p['workoutID']['images'][0] as String)
              .toList();
          List<String> workoutName = playlists
              .map<String>((p) => p['workoutID']['name'] as String)
              .toList();
          int initialIndex = 0; // Start with the first item, modify as needed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GifPlayer(
                gifs: gifUrls,
                initialIndex: initialIndex,
                workoutName: workoutName,
              ),
            ),
          );
        },
        label: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppText(
            text: "Start Workout",
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: GlobalVariables.mainBlack,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
