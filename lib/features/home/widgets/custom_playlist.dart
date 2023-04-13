import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:livin_sweaty/features/home/widgets/workout_desc.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../../../constants/global_variables.dart';
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
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (BuildContext context, int index) {
          final playlist = playlists[index]['workoutID'];
          return Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Image.network(playlist['images'][0]),
                title: Text(playlist['name']),
                subtitle: Text(playlist['description']),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WorkoutDesc()));
                },
              ),
            ),
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
