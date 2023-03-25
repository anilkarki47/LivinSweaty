import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}

// file picker
Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

// //  image picker from camera
// Future<List<File>> getImageCamera() async {
//   List<File> images = [];
//   try {
//        var image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image != null) {
//       images.add(File(image.path));
//     }
    
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return images;
// }

// //  image picker from gallery
// Future<List<File>> getImageGallery() async {
//   List<File> images = [];
//   try {
//        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       images.add(File(image.path));
//     }
    
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return images;
// }

