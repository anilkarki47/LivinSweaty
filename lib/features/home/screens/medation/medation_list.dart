import 'package:flutter/material.dart';
import '../../../../../constants/global_variables.dart';
import '../../../auth/widgets/app_text.dart';
import '../../../meal/screens/main_meal_page.dart';

class MedationList extends StatefulWidget {
  const MedationList({
    super.key,
  });

  @override
  State<MedationList> createState() => _MedationListState();
}

class _MedationListState extends State<MedationList> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Appbar work here!
          SliverAppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MealPage()));
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                "Medation",
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
                    "assets/images/medation.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),

          // Item List work here!
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // final workout = workoutList![index];
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
                              //   workout.images[0],
                              // ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppText(
                                    text: "medation.name",
                                    fontWeight: FontWeight.w900,
                                    color: GlobalVariables.mainBlack),
                                AppText(
                                    text: "medation.time",
                                    fontWeight: FontWeight.w500,
                                    color: GlobalVariables.midBlackGrey),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AppText(
                                        text: "medation.describtion",
                                        fontWeight: FontWeight.w500,
                                        color: GlobalVariables.midBlackGrey),
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
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
