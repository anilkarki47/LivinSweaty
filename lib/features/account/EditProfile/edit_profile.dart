// // ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_new

// import 'package:flutter/material.dart';
// import 'package:livin_sweaty/features/account/EditProfile/body.dart';
// import 'package:livin_sweaty/features/account/EditProfile/profile_screen.dart';

// class Updateprofilepage extends StatefulWidget {
//   const Updateprofilepage({Key? key}) : super(key: key);

//   @override
//   State<Updateprofilepage> createState() => _UpdateprofilepageState();
// }

// class _UpdateprofilepageState extends State<Updateprofilepage> {
//   bool passwordObsecured = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent, // 1
//           elevation: 0,
//           //backgroundColor: Colors.White,
//           title: const Text(
//             "EditProfile",
//             style: TextStyle(color: Colors.black),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const ProfileScreen()));
//             },
//           ),
//         ),
//         body: const Body());
//   }
// }
