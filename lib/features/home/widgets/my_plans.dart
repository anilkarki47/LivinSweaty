import 'package:flutter/material.dart';
import 'package:livin_sweaty/features/home/widgets/test.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({super.key});

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        // color: Colors.black,
        height: 205,
        child: GridView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) {
            // final mealData = meals![index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 8, // no padding for the first item
                right: index == 2 ? 0 : 8, // no padding for the last item
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WorkoutList()));
                },
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      color: Colors.amber,
                      // child: SingleItem(
                      //   image: mealData.images[0],
                      // ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "mealData.name",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        IconButton(
                          // onPressed: () => deleteMeal(mealData, index),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
