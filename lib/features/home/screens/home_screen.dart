import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livin_sweaty/constants/global_variables.dart';
import 'package:livin_sweaty/features/home/screens/notification/notification.dart';
import 'package:livin_sweaty/features/home/screens/notification/notification_page.dart';
import 'package:livin_sweaty/features/home/widgets/home_feature.dart';
import 'package:livin_sweaty/features/home/widgets/my_plans.dart';
import 'package:livin_sweaty/features/home/widgets/nearby_gyms.dart';
import 'package:provider/provider.dart';
import '../../../notificationservice/local_notification_service.dart';
import '../../../providers/user_provider.dart';
import '../../account/profile/profile_screen.dart';
import '../../auth/widgets/app_feature_text.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _currentDateTime = DateTime.now();
  late int totalNotificationsCounter = 0;
  // Model
  PushNotification? notificationInfo;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(() {
            _currentDateTime = DateTime.now();
          });
        }
      },
    );

    // notification work

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
          setState(() {
            totalNotificationsCounter++;
          });
        }
      },
    );

// 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          // print(message.notification!.title);
          // print(message.notification!.body);
          // print("message.data11 ${message.data}");
          PushNotification notification = PushNotification(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body'],
          );
          LocalNotificationService.displaynotification(message);

          setState(() {
            totalNotificationsCounter++;
            notificationInfo = notification;
          });
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          // print(message.notification!.title);
          // print(message.notification!.body);
          // print("message.data22 ${message.data['_id']}");

          PushNotification notification = PushNotification(
            title: message.notification!.title,
            body: message.notification!.body,
            dataTitle: message.data['title'],
            dataBody: message.data['body'],
          );
          setState(() {
            totalNotificationsCounter++;
            notificationInfo = notification;
          });
        }
      },
    );
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()));
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationPage(
                                          totalNotificationsCounter:
                                              totalNotificationsCounter,
                                        )));
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: GlobalVariables.midBlackGrey,
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: ClipOval(
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              ),
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
                    MyPlans(),
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
