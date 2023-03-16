import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../services/progress_services.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

@override
class _ProgressPageState extends State<ProgressPage> {
  final ProgressServices progressServices = ProgressServices();

  void addProgress() {
    progressServices.addProgress(context: context, images: images);
  }

  // List<File> images = [];
  // Future getImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   if (image == null) return Container();

  //   images.add(File(image.path));
  //   setState(() {
  //     images;
  //   });
  // }

List<File> images = [];

Future<void> getImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);
  if (image == null) return;

  images.add(File(image.path));
  setState(() {
    images;
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
                  onTap: addProgress,
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
