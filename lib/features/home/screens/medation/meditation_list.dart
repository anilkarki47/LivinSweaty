import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/workouts/screens/all_exercise/screens/workout_detail.dart';
import 'package:livin_sweaty/features/workouts/services/all_workout_services.dart';
import 'package:livin_sweaty/models/meditation.dart';
import '../../../../../common/widgets/loader.dart';
import '../../../../../constants/global_variables.dart';
import '../../../../../models/workout.dart';
import '../../../auth/widgets/app_text.dart';
import '../../services/home_services.dart';

class MeditationListScreen extends StatefulWidget {
  static const String routeName = '/workout-category';

  const MeditationListScreen({
    super.key,
  });

  @override
  State<MeditationListScreen> createState() => _MeditationListScreenState();
}

class _MeditationListScreenState extends State<MeditationListScreen> {
  List<Meditation>? meditationList;
  final AllMeditaionServices meditationServices = AllMeditaionServices();

  @override
  void initState() {
    super.initState();
    fetchAllMeditations();
  }

  fetchAllMeditations() async {
    meditationList = await meditationServices.fetchAllMeditations(context);
    setState(() {});
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: meditationList == null
          ? const Loader()
          : CustomScrollView(
              slivers: [
                // Appbar work here!
                SliverAppBar(
                  expandedHeight: 180,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text(
                      "Meditation",
                      style: TextStyle(
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
                      final meditation = meditationList![index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => WorkoutDetails(
                          //       workout: workout,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            // color: GlobalVariables.lightGrey,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              height: 130,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    color: GlobalVariables.lightGrey,
                                    // child: Image.network(
                                    //   meditation.images[0],
                                    // ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AppText(
                                          text: meditation.name,
                                          fontWeight: FontWeight.w900,
                                          color: GlobalVariables.mainBlack),
                                      AppText(
                                          text: meditation.artist,
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
                                              text: meditation.duration,
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
                        ),
                      );
                    },
                    childCount: meditationList!.length,
                  ),
                ),
              ],
            ),
    );
  }
}
