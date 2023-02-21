import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:livin_sweaty/common/widgets/custom_textfield.dart';

import '../../../constants/global_variables.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final TextEditingController workoutNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String category = 'Workouts';
  @override
  void dispose() {
    super.dispose();
    workoutNameController.dispose();
    descriptionController.dispose();
  }

  List<String> appFeatures = ['Workouts', 'Meals', 'Medation'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Workouts"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                DottedBorder(
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
                              fontSize: 15, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: workoutNameController,
                  hintText: "Workout Name",
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: "Workout Discription",
                  maxLines: 7,
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    color: GlobalVariables.lightGrey,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
