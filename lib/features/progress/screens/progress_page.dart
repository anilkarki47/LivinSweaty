import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  text: "Pick from Camera",
                  onTap: () {},
                  color: GlobalVariables.midBlackGrey,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtom(
                  text: "Pick from Gallery",
                  onTap: selectImage,
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
