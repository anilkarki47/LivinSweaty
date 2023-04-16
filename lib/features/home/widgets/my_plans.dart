import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livin_sweaty/features/home/widgets/custom_playlist.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../../../common/widgets/single_item.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({super.key});

  @override
  State<MyPlans> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlans> {
  List<dynamic> playlists = [];

  @override
  void initState() {
    super.initState();
    fetchWorkouts();
  }

// Custom function to remove duplicates based on playlist name
  List<dynamic> removeDuplicatesByPlaylistName(List<dynamic> playlists) {
    List<dynamic> uniquePlaylists = [];
    Set<String> seenPlaylistNames = <String>{};

    for (var playlist in playlists) {
      String playlistName = playlist['playlistID']['name'];
      if (!seenPlaylistNames.contains(playlistName)) {
        seenPlaylistNames.add(playlistName);
        uniquePlaylists.add(playlist);
      }
    }
    return uniquePlaylists;
  }

  Future<void> fetchWorkouts() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final String currentUserId = userProvider.user.id;
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
        List<dynamic> filteredData = data['data'].where((item) {
          return item['user']['_id'] == currentUserId;
        }).toList();

        // Remove duplicates based on playlist name
        filteredData = removeDuplicatesByPlaylistName(filteredData);

        // Add the workouts key to each playlist object
        for (var playlist in filteredData) {
          playlist['playlistID']['workouts'] = data['data']
              .where((item) =>
                  item['playlistID']['_id'] == playlist['playlistID']['_id'])
              .map((item) => item['workoutID'])
              .toList();
        }

        setState(() {
          playlists = filteredData;
        });
      } else {
        throw Exception('Failed to fetch workouts');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(playlists);
    return SizedBox(
      height: 225,
      child: GridView.builder(
        itemCount: playlists.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          final workout = playlists[index]['workoutID'] ?? {};
          final playlist = playlists[index]['playlistID'] ?? {};
          final user = playlists[index]['user'] ?? {};
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CustomPlaylist(playlist: playlists[index]['playlistID']),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(
                              0, 1.5), // changes position of shadow
                        )
                      ],
                    ),
                    height: 160,
                    width: 300,
                    child: SingleItem(
                      image: workout['images']?[0] ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        playlist['name'] ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
