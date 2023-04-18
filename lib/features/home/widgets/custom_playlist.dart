import 'package:flutter/material.dart';

import 'package:livin_sweaty/features/home/widgets/playlist_player/exercise_page.dart';

import '../../../constants/global_variables.dart';
import '../../auth/widgets/app_text.dart';

class CustomPlaylist extends StatefulWidget {
  final Map<String, dynamic> playlist;
  const CustomPlaylist({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  CustomPlaylistState createState() => CustomPlaylistState();
}

class CustomPlaylistState extends State<CustomPlaylist> {
  late List<dynamic> playlists;

  @override
  void initState() {
    super.initState();
    playlists = widget.playlist['workouts'] ?? [];
    // print('Playlists: $playlists'); // Debugging print statement
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: playlists.length,
        itemBuilder: (BuildContext context, int index) {
          final workout = playlists[index];
          // print(workout);
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
            child: Center(
              child: ListTile(
                leading: SizedBox(
                  width: 80,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              workout['images']?[0] ?? '',
                            ),
                          ),
                        ),
                        width: 80,
                      ),
                    ),
                  ),
                ),
                title: Transform.scale(
                  scale: 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 3),
                    child: Text(workout['name'] ?? ''),
                  ),
                ),
                subtitle: Transform.scale(
                  scale: 1.1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 3),
                    child: Text(workout['category'] ?? ''),
                  ),
                ),
                trailing: SizedBox(
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
              .map<String>((p) => p['images'][0] as String) // Update this line
              .toList();
          List<String> workoutName = playlists
              .map<String>((p) => p['name'] as String) // Update this line
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
