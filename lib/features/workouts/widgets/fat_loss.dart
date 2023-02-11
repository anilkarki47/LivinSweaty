import 'package:flutter/material.dart';

class FatLoss extends StatelessWidget {
  const FatLoss({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // margin: const EdgeInsets.symmetric(horizontal: 15),
      // color: Colors.black,
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: size.width / 20 - 5.6),
              mainAxisSpacing: size.width / 20 - 3.6,
              childAspectRatio: 0.8,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/leg.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/lift.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/press.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/chest.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
