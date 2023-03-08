import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/custom_button.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';
import '../../../../common/widgets/plain _textfield.dart';
import '../../../../constants/global_variables.dart';
import '../../services/admin_services.dart';

class AddWorkoutScreen extends StatefulWidget {
  static const String routeName = '/add-workout';
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final TextEditingController workoutNameController = TextEditingController();
  final TextEditingController workoutCountController = TextEditingController();
  final TextEditingController workoutTargetController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final AdminServices adminServices = AdminServices();

  List<File> images = [];
  String category = "Chest";
  final _addWorkoutFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    workoutNameController.dispose();
    workoutCountController.dispose();
    workoutTargetController.dispose();
    descriptionController.dispose();
  }

  List<String> workoutCategories = [
    'Chest',
    'Back',
    'Shoulders',
    'Biceps',
    'Triceps',
    'Legs',
    'Abs'
  ];

  void addWorkout() {
    if (_addWorkoutFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.addWorkout(
          context: context,
          name: workoutNameController.text,
          count: workoutCountController.text,
          target: workoutTargetController.text,
          description: descriptionController.text,
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Workout"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addWorkoutFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
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
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Select workout Image",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                PlainTextField(
                  controller: workoutNameController,
                  hintText: "Workout Name",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
                PlainTextField(
                  controller: workoutCountController,
                  hintText: "Workout Reps & Sets",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
                PlainTextField(
                  controller: workoutTargetController,
                  hintText: "Muscles Target Area",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),

                // PlainTextField(
                //   controller: catagoryController,
                //   hintText: "Workout Category",
                //   hintStyle: const TextStyle(
                //     fontSize: 18.0,
                //     color: GlobalVariables.lightGrey,
                //   ),
                // ),

                const SizedBox(height: 10),
                PlainTextField(
                  controller: descriptionController,
                  hintText: "Workout Discription",
                  maxLines: 7,
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                // category
                // const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      AppText(
                          fontWeight: FontWeight.normal,
                          text: "Choose Category:   "),
                      DropdownButton(
                        value: category,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: workoutCategories.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            category = newVal!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomButtom(
                    text: "Add",
                    onTap: addWorkout,
                    color: GlobalVariables.mainBlack,
                    textColor: Colors.white,
                    borderColor: Colors.transparent),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
