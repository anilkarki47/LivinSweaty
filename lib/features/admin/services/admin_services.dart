// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:livin_sweaty/constants/error_handling.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:livin_sweaty/models/user.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../models/meal.dart';
import '../../../models/workout.dart';
import '../../../providers/user_provider.dart';

class AdminServices {
  void addWorkout({
    required BuildContext context,
    required String name,
    required String count,
    required String target,
    required String description,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dy0zkzzt7", "tueo7nyi");
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Workout workout = Workout(
          name: name,
          count: count,
          target: target,
          description: description,
          images: imageUrls,
          category: category);

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-workout'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: workout.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          showSnackBar(context, "Workout added sucessfully.");
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get all the workouts

  Future<List<Workout>> fetchAllWorkouts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Workout> workoutList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-workouts'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

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

  void deleteWorkout({
    required BuildContext context,
    required Workout workout,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-workout'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': workout.id,
        }),
      );

 
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // add meal
  void addMeal({
    required BuildContext context,
    required String name,
    required String prepTime,
    required String description,
    required String ingredients,
    required String instructions,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dy0zkzzt7", "tueo7nyi");
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Meal meal = Meal(
          name: name,
          prepTime: prepTime,
          description: description,
          ingredients: ingredients,
          instructions: instructions,
          images: imageUrls,
          category: category);

      http.Response res = await http.post(
        Uri.parse("$uri/admin/add-meal"),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: meal.toJson(),
      );

 
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          showSnackBar(context, "Meal added sucessfully.");
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// get all the meals
  Future<List<Meal>> fetchAllMeals(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Meal> mealList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-meal'), headers: {
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

// delete meal
  void deleteMeal({
    required BuildContext context,
    required Meal meal,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-meal'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': meal.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get all the users
  Future<List<User>> fetchAllUsers(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<User> userList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-users'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            userList.add(
              User.fromJson(
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
    return userList;
  }

  // delete meal
  void deleteUser({
    required BuildContext context,
    required User user,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-user'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': user.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
