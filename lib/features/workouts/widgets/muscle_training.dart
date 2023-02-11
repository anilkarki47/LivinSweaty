import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class MuscleTraining extends StatelessWidget {
  const MuscleTraining({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.4,
        padding: EdgeInsets.symmetric(horizontal: size.width / 20 - 5.6),
        mainAxisSpacing: size.width / 30,
        scrollDirection: Axis.horizontal,
        children: [
          // elements here!
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/intense.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/leg2.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/chest.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/fit.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
              color: GlobalVariables.midBlackGrey,
            ),
          ),
        ],
      ),
    );
  }
}
