import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../constants/global_variables.dart';
import '../../auth/widgets/app_text.dart';

class WorkoutDesc extends StatefulWidget {
  final dynamic playlist;

  const WorkoutDesc({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  State<WorkoutDesc> createState() => _WorkoutDescState();
}

class _WorkoutDescState extends State<WorkoutDesc> {
  @override
  Widget build(BuildContext context) {
    final data = widget.playlist['workoutID'];
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Text(
                      data['name'],
                      style: const TextStyle(
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
                  onTap: () =>
                      {Share.share(data['images'][0], subject: data['name'])},
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
                child: Image.network(
                  data['images'][0],
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CATEGORY:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            AppText(
                              text: data['category'],
                              fontWeight: FontWeight.w400,
                              color: GlobalVariables.midBlackGrey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "PREPARATION & EXECUTION:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            AppText(
                              text: data['description'],
                              fontWeight: FontWeight.w400,
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
