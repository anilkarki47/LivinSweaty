import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../services/progress_services.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

// final ImagePicker _picker = ImagePicker();
// // Pick an image
// final Future<XFile?> image = _picker.pickImage(source: ImageSource.gallery);
// // Capture a photo
// final Future<XFile?> photo = _picker.pickImage(source: ImageSource.camera);

@override
class _ProgressPageState extends State<ProgressPage> {
  final ProgressServices progressServices = ProgressServices();

  List<File> images = [];

// void addProgress(){
//   progressServices.addProgress(context: context, name: .text, images: images)
// }

  void selectImage() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;

    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Progress"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              children: [
                _image != null
                    ? Image.file(
                        _image!,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 300,
                        width: double.infinity,
                        color: GlobalVariables.mainBlack,
                        child: Center(
                            child: AppText(
                                text: "Select an Image!",
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  text: "Pick from Camera",
                  onTap: () => getImage(ImageSource.camera),
                  color: GlobalVariables.midBlackGrey,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtom(
                  text: "Pick from Gallery",
                  onTap: () => getImage(ImageSource.gallery),
                  color: GlobalVariables.midBlackGrey,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtom(
                  text: "Post Image",
                  onTap: () {},
                  color: GlobalVariables.mainBlack,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
              ],
            ),
          ),
        ));
  }
}
