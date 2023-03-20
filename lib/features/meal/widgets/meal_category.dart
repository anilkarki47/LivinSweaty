import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../auth/widgets/app_large_text.dart';
import '../screens/meal_category_list.dart';

class MealCategery extends StatelessWidget {
  const MealCategery({super.key});

  void navigeToMealCategory(BuildContext context, String categoty) {
    Navigator.pushNamed(context, MealCategoryList.routeName,
        arguments: categoty);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: GridView.builder(
        itemCount: GlobalVariables.mealCategory.length,
        padding: EdgeInsets.symmetric(horizontal: size.width / 20 - 5.6),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: .583,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigeToMealCategory(
              context,
              GlobalVariables.mealCategory[index]['title']!,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width / 20 - 5.6),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: GlobalVariables.midBlackGrey,
              ),
              child: Center(
                child: AppLargeText(
                  text: GlobalVariables.mealCategory[index]['title']!,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
