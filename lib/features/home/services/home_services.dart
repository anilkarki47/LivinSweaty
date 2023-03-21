// get all the workouts

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livin_sweaty/models/meditation.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class AllMeditaionServices {
  // get all the meals
  Future<List<Meditation>> fetchAllMeditations(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Meditation> meditationList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/auth/get-meditation'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            meditationList.add(
              Meditation.fromJson(
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
    return meditationList;
  }
}
