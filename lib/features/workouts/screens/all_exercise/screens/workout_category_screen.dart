import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/workouts/services/all_workout_services.dart';
import '../../../../../common/widgets/loader.dart';
import '../../../../../models/workout.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: workoutList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${widget.category} Workouts',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    itemCount: workoutList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final workout = workoutList![index];

                      return GestureDetector(
                        // onTap: () {
                        //   Navigator.pushNamed(
                        //     context,
                        //     ProductDetailScreen.routeName,
                        //     arguments: workout,
                        //   );
                        // },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    workout.images[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 5,
                                right: 15,
                              ),
                              child: Text(
                                workout.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
