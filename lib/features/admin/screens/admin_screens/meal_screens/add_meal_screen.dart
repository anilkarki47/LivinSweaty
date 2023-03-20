import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/custom_button.dart';
import 'package:livin_sweaty/constants/utils.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';
import '../../../../../common/widgets/plain _textfield.dart';
import '../../../../../constants/global_variables.dart';
import '../../../services/admin_services.dart';

class AddMealScreen extends StatefulWidget {
  static const String routeName = '/add-meal';
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController mealTimeController = TextEditingController();
  final TextEditingController mealIngredientController =
      TextEditingController();
  final TextEditingController instructionController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final AdminServices adminServices = AdminServices();

  List<File> images = [];
  String category = "Vegan";
  final _addMealFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    mealNameController.dispose();
    mealTimeController.dispose();
    mealIngredientController.dispose();
    instructionController.dispose();
    descriptionController.dispose();
  }

  List<String> mealCategories = [
    'Vegan',
    'NonVeg',
    'Diet',
  ];

  void addMeal() {
    if (_addMealFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.addMeal(
        context: context,
        name: mealNameController.text,
        prepTime: mealTimeController.text,
        description: descriptionController.text,
        ingredients: mealIngredientController.text,
        instructions: instructionController.text,
        category: category,
        images: images,
      );
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
        title: const Text("Add Meal"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addMealFormKey,
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
                                  "Select Meal Image",
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
                  controller: mealNameController,
                  hintText: "Meal Name",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
                PlainTextField(
                  controller: mealTimeController,
                  hintText: "Prepatation Time",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
                PlainTextField(
                  controller: mealIngredientController,
                  hintText: "Prepatation Time",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
                PlainTextField(
                  controller: instructionController,
                  hintText: "Calories Received",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),

                const SizedBox(height: 10),
                PlainTextField(
                  controller: descriptionController,
                  hintText: "Meal Discription",
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
                        items: mealCategories.map((String item) {
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
                    onTap: addMeal,
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
