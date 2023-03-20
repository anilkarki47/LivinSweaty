import 'package:flutter/material.dart';
import 'package:livin_sweaty/models/meal.dart';

import '../../../../../constants/global_variables.dart';
import '../../../common/widgets/loader.dart';
import '../../auth/widgets/app_text.dart';
import '../services/meal_services.dart';

class MealCategoryList extends StatefulWidget {
  static const String routeName = '/meal-category';
  final String category;
  const MealCategoryList({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<MealCategoryList> createState() => _MealCategoryListState();
}

class _MealCategoryListState extends State<MealCategoryList> {
  List<Meal>? mealList;
  final AllMealServices mealServices = AllMealServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryMeals();
  }

  fetchCategoryMeals() async {
    mealList = await mealServices.fetchCategoryMeals(
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
      body: mealList == null
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
                    background: const Image(
                        image: AssetImage(
                          "assets/images/diet2.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),

                // Item List work here!
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final meal = mealList![index];
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
                                left: 10,
                                right: 10,
                                top: 15,
                                bottom: 15,
                              ),
                              height: 130,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    color: GlobalVariables.lightGrey,
                                    child: Image.network(
                                      meal.images[0],
                                    ),
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
                                          text: meal.name,
                                          fontWeight: FontWeight.w900,
                                          color: GlobalVariables.mainBlack),
                                      AppText(
                                          text: meal.prepTime,
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
                                              text: meal.description,
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
                    childCount: mealList!.length,
                  ),
                ),
              ],
            ),
    );
  }
}
