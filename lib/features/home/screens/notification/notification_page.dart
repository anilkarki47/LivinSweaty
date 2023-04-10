import 'package:flutter/material.dart';

import 'notification.dart';

class NotificationPage extends StatefulWidget {
  final int totalNotificationsCounter;

  const NotificationPage({
    Key? key,
    required this.totalNotificationsCounter,
  }) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late PushNotification? notificationInfo;
  late int totalNotificationsCounter;

  @override
  void initState() {
    super.initState();
    totalNotificationsCounter = widget.totalNotificationsCounter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(totalNotificationsCounter.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: listView(),
      ),
    );
  }
}

Widget listView() {
  return ListView.separated(
      itemBuilder: (context, index) {
        return listViewItem(index);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0,
        );
      },
      itemCount: 15);
}

Widget listViewItem(int index) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        prefixIcon(),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              message(index),
              const SizedBox(
                height: 5,
              ),
              notification(index),
            ],
          ),
        ),
        timeDate(index)
      ],
    ),
  );
}

Widget prefixIcon() {
  return Container(
    height: 50,
    width: 50,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade300,
    ),
    child: Icon(
      Icons.notifications,
      size: 25,
      color: Colors.grey.shade700,
    ),
  );
}

Widget message(int index) {
  double textSize = 15;
  return RichText(
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    text: TextSpan(
      text: "Message",
      style: TextStyle(
        fontSize: textSize,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget notification(int index) {
  double textSize = 13;
  return RichText(
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    text: TextSpan(
      text: "Notification Description",
      style: TextStyle(
        fontSize: textSize,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget timeDate(int index) {
  return Container(
    margin: const EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "09-04-2023",
          style: TextStyle(fontSize: 10),
        ),
      ],
    ),
  );
}
