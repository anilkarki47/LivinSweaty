import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/loader.dart';
import '../../../common/widgets/single_item.dart';
import '../../../constants/global_variables.dart';
import '../../../models/progress.dart';
import '../services/progress_services.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  List<Progress>? progress;

  final ProgressServices progressServices = ProgressServices();

  void addProgress() {
    try {
      progressServices.addProgress(
        context: context,
        images: _selectedImages,
      );
      setState(() {
        _selectedImages.clear();
      });
    } catch (e) {
      debugPrint("Select image!");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllProgress();
  }

// separate function because init stat cant be turned asynchronous
  fetchAllProgress() async {
    progress = await progressServices.fetchAllProgress(context);
    setState(() {});
  }

  final List<File> _selectedImages = [];

  Future<void> _selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _selectImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
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
              _selectedImages.isNotEmpty
                  ? CarouselSlider(
                      items: _selectedImages.map(
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
                onTap: () => _selectImageFromCamera(),
                color: GlobalVariables.midBlackGrey,
                textColor: Colors.white,
                borderColor: Colors.transparent,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtom(
                text: "Pick from Gallery",
                onTap: () => _selectImageFromGallery(),
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
              const SizedBox(
                height: 30,
              ),
              progress == null
                  ? const Loader()
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: progress!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final progressData = progress![index];

                        return Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: SingleItem(
                                image: progressData.images[0],
                              ),
                            ),
                          ],
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
