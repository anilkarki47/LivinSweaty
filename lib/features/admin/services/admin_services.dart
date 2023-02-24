import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:livin_sweaty/features/workouts/screens/workouts.dart';

class AdminServices {
  void addWorkout({
    required BuildContext context,
    required String name,
    required String description,
    required List<File> images,
  }) async {
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
        description: description,
        images: imageUrls,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
