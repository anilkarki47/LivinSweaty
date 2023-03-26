import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/home/widgets/home_feature.dart';
import 'package:livin_sweaty/features/home/widgets/my_plans.dart';
import 'package:livin_sweaty/features/home/widgets/nearby_gyms.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../account/playlist/test.dart';
import '../../auth/widgets/app_feature_text.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _currentDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentDateTime = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                height: 70,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyPlaylists()));
                              },
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: GlobalVariables.offWhite,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/20048400.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Hi, ",
                                      style: TextStyle(
                                          color: GlobalVariables.lightGrey,
                                          fontSize: 14,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      user.name,
                                      style: const TextStyle(
                                          color: GlobalVariables.lightGrey,
                                          fontSize: 14,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${_currentDateTime.year} ${DateFormat('MMM').format(_currentDateTime)} ${_currentDateTime.day}, ${DateFormat('EEEE').format(_currentDateTime)}",
                                  style: const TextStyle(
                                      color: GlobalVariables.midBlackGrey,
                                      fontSize: 16,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  DateFormat('h:mm:ss a')
                                      .format(_currentDateTime),
                                  style: const TextStyle(
                                      color: GlobalVariables.midBlackGrey,
                                      fontSize: 16,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // notification
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: GlobalVariables.midBlackGrey,
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: ClipOval(
                              child: Icon(Icons.notifications),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const HomeFeature(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFeatureText(
                      text: 'Nearby Gyms',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const NearbyGyms(),
                    // My Plans
                    const SizedBox(
                      height: 20,
                    ),
                    AppFeatureText(
                      text: 'My Plans',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyPlans(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
