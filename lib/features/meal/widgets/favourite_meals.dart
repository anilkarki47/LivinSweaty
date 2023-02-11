import 'package:flutter/material.dart';

class FavouriteMeal extends StatelessWidget {
  const FavouriteMeal({super.key});

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
                        image: AssetImage('assets/images/diet.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/diet2.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/diet3.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/diet.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.favorite, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
