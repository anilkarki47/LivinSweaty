import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livin_sweaty/models/workout.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class AllWorkoutServices {
  Future<List<Workout>> fetchCatogeryWorkouts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Workout> workoutList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/workouts?category=$category'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            workoutList.add(
              Workout.fromJson(
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
    return workoutList;
  }
}
