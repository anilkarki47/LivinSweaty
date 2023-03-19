import 'dart:convert';
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
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dy0zkzzt7", "tueo7nyi");
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: "Progress"),
        );
        imageUrls.add(res.secureUrl);
      }

      Progress progress = Progress(images: imageUrls);

      http.Response res = await http.post(
        Uri.parse('$uri/auth/add-progress'),
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
          showSnackBar(context, "Progress added sucessfully.");
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Progress>> fetchAllProgress(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Progress> progressList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/auth/get-progress'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'x-auth-token': userProvider.user.token,
      });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSucess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            progressList.add(
              Progress.fromJson(
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
    return progressList;
  }
}
