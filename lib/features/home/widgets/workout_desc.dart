import 'package:flutter/material.dart';

import 'package:livin_sweaty/features/auth/widgets/app_feature_text.dart';

import '../../../../../constants/global_variables.dart';

import '../../auth/widgets/app_text.dart';

class WorkoutDesc extends StatefulWidget {
  const WorkoutDesc({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutDesc> createState() => _WorkoutDescState();
}

class _WorkoutDescState extends State<WorkoutDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "widget.workout.name",
                      style: TextStyle(
                        fontSize: 30,
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
                    Navigator.pop(context, true);
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
                InkWell(
                  onTap: () => {
                    // Share.share(widget.workout.images[0],
                    //     subject: widget.workout.name)
                  },
                  child: Container(
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
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(bottom: 50),
                // child: Image.network(
                //   widget.workout.images[0],
                //   width: double.maxFinite,
                //   fit: BoxFit.cover,
                // ),
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
                              text: "PREPARATION & EXECUTION:",
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            AppText(
                              text: "widget.workout.description",
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
