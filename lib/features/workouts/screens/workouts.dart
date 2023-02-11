import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/workouts/widgets/fat_loss.dart';
import 'package:livin_sweaty/features/workouts/widgets/muscle_training.dart';
import 'package:livin_sweaty/features/workouts/widgets/recommended_workouts.dart';

import '../../auth/widgets/app_feature_text.dart';
import '../../auth/widgets/app_large_text.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: AppLargeText(
                  text: 'Workouts',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: AppFeatureText(
                  text: 'Recomended Workouts',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const RecommendedWorkouts(),
              const SizedBox(
                height: 20,
              ),
              // fat loss
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: AppFeatureText(
                  text: 'Fat Loss',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const FatLoss(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: AppFeatureText(
                  text: 'Muscles Training',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const MuscleTraining(),
            ],
          ),
        ),
      ),
    );
  }
}
