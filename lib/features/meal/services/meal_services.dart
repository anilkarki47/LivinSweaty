// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:livin_sweaty/models/meal.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class AllMealServices {
  Future<List<Meal>> fetchCategoryMeals(
      {required BuildContext context, required String category}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Meal> mealList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/meals?category=$category'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            mealList.add(
              Meal.fromJson(
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
    return mealList;
  }

  // water intake
  void addWaterIntake({
    required BuildContext context,
    required int waterIntake,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/auth/add-waterIntake"),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'waterIntake': waterIntake,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
