import 'package:flutter/cupertino.dart';
import 'package:livin_sweaty/constants/global_variables.dart';

class HomeFeatures extends StatefulWidget {
  const HomeFeatures({super.key});

  @override
  State<HomeFeatures> createState() => _HomeFeaturesState();
}

class _HomeFeaturesState extends State<HomeFeatures> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index.isEven
            ? GlobalVariables.midBlackGrey
            : GlobalVariables.lightGrey,
      ),
    );
  }
}
