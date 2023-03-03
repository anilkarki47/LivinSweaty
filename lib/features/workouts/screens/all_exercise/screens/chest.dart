import 'package:flutter/material.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/auth/widgets/app_text.dart';

class Chest extends StatefulWidget {
  const Chest({super.key});

  @override
  State<Chest> createState() => _ChestState();
}

class _ChestState extends State<Chest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.offWhite,
      body: CustomScrollView(
        slivers: [
          // Appbar work here!
          const SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "CHEST",
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
                    'assets/images/chest.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),

          // Item List work here!
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
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
                          Image.asset(
                            'assets/images/chest.jpg',
                            height: double.infinity,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                  text: "Barbell Bench Press",
                                  fontWeight: FontWeight.w900,
                                  color: GlobalVariables.mainBlack),
                              AppText(
                                  text: "4 Sets x 12 Reps",
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
                                      text: "Chest, Triceps",
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
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
