import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:livin_sweaty/models/progress.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class ProgressServices {
  void addProgress({
    required BuildContext context,
    required String name,
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

      Progress progress = Progress(name: name, images: imageUrls);
    
    http.Response res = await http.post(
        Uri.parse('$uri/admin/add-workout'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: progress.toJson(),
      );

      // ignore: use_build_context_synchronously
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
}
