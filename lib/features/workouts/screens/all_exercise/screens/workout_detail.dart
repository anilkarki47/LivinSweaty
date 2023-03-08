import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/auth/widgets/app_feature_text.dart';

import '../../../../../constants/global_variables.dart';
import '../../../../auth/widgets/app_text.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({super.key});

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.offWhite,
      body: CustomScrollView(
        slivers: [
          // Appbar work here!
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Container(
                color: Colors.white,
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Text(
                      "BARBELL WORKOUT",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: GlobalVariables.mainBlack,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.black26,
                    ),
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 8,
                      bottom: 8,
                    ),
                    // Color
                    child: const Icon(
                      Icons.arrow_back_ios, // Icon
                      color: Colors.white,
                    ),
                  ),
                ),

                // Share Icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.black26,
                  ),
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 8,
                    bottom: 8,
                    right: 5,
                  ),
                  // Color
                  child: const Icon(
                    Icons.share, // Icon
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  "assets/images/20048400.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFeatureText(
                              text: "SETS & REPS:",
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            AppText(
                              text: "3 Sets x 12 Reps",
                              fontWeight: FontWeight.w500,
                              color: GlobalVariables.midBlackGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFeatureText(
                              text: "TARGET MUSCLES:",
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            AppText(
                              text: "3 Sets x 12 Reps",
                              fontWeight: FontWeight.w500,
                              color: GlobalVariables.midBlackGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFeatureText(
                              text: "PREPARATION & EXECUTION:",
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            AppText(
                              text:
                                  "The Journal of Living Together is a peer-reviewed academic journal that publishes a collection of articles that reflect various aspects of peace and conflict studies. The contributions from across the disciplines and grounded by relevant philosophical traditions and theoretical and methodological approaches systematically broach topics dealing with tribal, ethnic, racial, cultural, religious and sectarian conflicts, as well as alternative dispute resolution and peacebuilding processes. Through this journal it is our intention to inform, inspire, reveal and explore the intricate and complex nature of human interaction in the context of ethno-religious identity and the roles it plays in war and peace. By sharing theories, methods, practices, observations and valuable experiences we mean to open a broader, more inclusive dialogue between policymakers, academics, researchers, religious leaders, representatives of ethnic groups and indigenous peoples, as well as field practitioners around the world.The Journal of Living Together is a peer-reviewed academic journal that publishes a collection of articles that reflect various aspects of peace and conflict studies. The contributions from across the disciplines and grounded by relevant philosophical traditions and theoretical and methodological approaches systematically broach topics dealing with tribal, ethnic, racial, cultural, religious and sectarian conflicts, as well as alternative dispute resolution and peacebuilding processes. Through this journal it is our intention to inform, inspire, reveal and explore the intricate and complex nature of human interaction in the context of ethno-religious identity and the roles it plays in war and peace. By sharing theories, methods, practices, observations and valuable experiences we mean to open a broader, more inclusive dialogue between policymakers, academics, researchers, religious leaders, representatives of ethnic groups and indigenous peoples, as well as field practitioners around the world.The Journal of Living Together is a peer-reviewed academic journal that publishes a collection of articles that reflect various aspects of peace and conflict studies. The contributions from across the disciplines and grounded by relevant philosophical traditions and theoretical and methodological approaches systematically broach topics dealing with tribal, ethnic, racial, cultural, religious and sectarian conflicts, as well as alternative dispute resolution and peacebuilding processes. Through this journal it is our intention to inform, inspire, reveal and explore the intricate and complex nature of human interaction in the context of ethno-religious identity and the roles it plays in war and peace. By sharing theories, methods, practices, observations and valuable experiences we mean to open a broader, more inclusive dialogue between policymakers, academics, researchers, religious leaders, representatives of ethnic groups and indigenous peoples, as well as field practitioners around the world.",
                              fontWeight: FontWeight.w500,
                              color: GlobalVariables.midBlackGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
