import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Workouts"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              DottedBorder(
                  child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.folder_open,
                      size: 40,
                    ),
                    const SizedBox(height: 15),
                    Text("Select workout Image",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade400))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
