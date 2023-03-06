import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/workouts/services/all_workout_services.dart';
import '../../../../../common/widgets/loader.dart';
import '../../../../../constants/global_variables.dart';
import '../../../../../models/workout.dart';
import '../../../../auth/widgets/app_text.dart';

class WorkoutCategoryScreen extends StatefulWidget {
  static const String routeName = '/workout-category';
  final String category;
  const WorkoutCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<WorkoutCategoryScreen> createState() => _WorkoutCategoryScreenState();
}

class _WorkoutCategoryScreenState extends State<WorkoutCategoryScreen> {
  List<Workout>? workoutList;
  final AllWorkoutServices workoutServices = AllWorkoutServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryWorkouts();
  }

  fetchCategoryWorkouts() async {
    workoutList = await workoutServices.fetchCatogeryWorkouts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: workoutList == null
          ? const Loader()
          : CustomScrollView(
              slivers: [
                // Appbar work here!
                SliverAppBar(
                  expandedHeight: 180,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      widget.category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    expandedTitleScale: 1.6,
                    centerTitle: false,
                    collapseMode: CollapseMode.parallax,
                    background: Image(
                        image: AssetImage(
                          GlobalVariables.workoutCategory[0]['image']!,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),

                // Item List work here!
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final workout = workoutList![index];
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 15,
                        ),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          // color: GlobalVariables.lightGrey,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 15),
                            height: 130,
                            // width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  workout.images[0],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AppText(
                                        text: workout.name,
                                        fontWeight: FontWeight.w900,
                                        color: GlobalVariables.mainBlack),
                                    AppText(
                                        text: workout.count,
                                        fontWeight: FontWeight.w500,
                                        color: GlobalVariables.midBlackGrey),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.adjust,
                                          size: 20,
                                          color: GlobalVariables.midBlackGrey,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        AppText(
                                            text: workout.target,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                GlobalVariables.midBlackGrey),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: workoutList!.length,
                  ),
                ),
              ],
            ),
    );
  }
}
