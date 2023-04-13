import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livin_sweaty/models/playlist_name.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/error_handling.dart';
import '../../../../constants/global_variables.dart';
import '../../../../constants/utils.dart';
import '../../../../models/playlist_model.dart';
import '../../../../providers/user_provider.dart';

class PlanServices {
  void addWorkoutToPlaylist({
    required BuildContext context,
    required Object playlistId,
    required Object workoutId,
  }) async {
    print(playlistId);
    print(workoutId);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/add-selected-workout"),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: json.encode({
          'playlistID': playlistId,
          'workoutID': workoutId,
        }),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // add playlist name
  void addPlaylistName({
    required BuildContext context,
    required String playlistName,
  }) async {
    // print(playlistName);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      PlaylistName playlistname = PlaylistName(name: playlistName);
      http.Response res = await http.post(
        Uri.parse("$uri/auth/add-playlist-name"),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: playlistname.toJson(),
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// get all the playlist name

  Future<List<PlaylistName>> fetchAllPlaylistName(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<PlaylistName> playlistNameList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-playlist-name'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            playlistNameList.add(
              PlaylistName.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return playlistNameList;
  }

// get all the playlist

  Future<List<PlaylistModel>> fetchAllPlaylist(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<PlaylistModel> playlistList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-playlist-name'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            playlistList.add(
              PlaylistModel.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return playlistList;
  }
}
