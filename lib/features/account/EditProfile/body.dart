// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'edit_profile.dart';

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   State<Body> createState() => BodyState();
// }

// class BodyState extends State<Body> {
//   File? image;
//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       final imageTemp = File(image.path);
//       setState(() => this.image = imageTemp);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future pickImageviacamera() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (image == null) return;
//       //final imageTemp = File(image.path);
//       final imagepermanent = await saveimagepermanently(image.path);
//       setState(() => this.image = imagepermanent);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> saveimagepermanently(String imagepath) async {
//     final directory = await getApplicationSupportDirectory();
//     final name = basename(imagepath);
//     final image = File('${directory.path}/$name');

//     return File(imagepath).copy(image.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       padding: EdgeInsets.only(
//           top: size.height / 37.5,
//           left: size.width / 17.5,
//           right: size.width / 17.5),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1.5,
//               blurRadius: 2,
//               offset: const Offset(0, 1.5), // changes position of shadow
//             )
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(size.width / 35),
//           child: Column(children: [
//             SizedBox(
//               height: 115,
//               width: 115,
//               child: Stack(
//                 fit: StackFit.expand,
//                 clipBehavior: Clip.none,
//                 children: [
//                   image != null
//                       ? CircleAvatar(
//                           radius: 55,
//                           backgroundColor: Colors.black,
//                           child: CircleAvatar(
//                             radius: 53,
//                             backgroundColor: Colors.white,
//                             child: CircleAvatar(
//                               radius: 50,
//                               child: ClipOval(
//                                   child: Image.file(image!,
//                                       width: 150, fit: BoxFit.cover)),
//                             ),
//                           ),
//                         )
//                       : const CircleAvatar(
//                           radius: 55,
//                           backgroundColor: Colors.black,
//                           child: CircleAvatar(
//                             radius: 53,
//                             backgroundColor: Colors.white,
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundColor: Colors.white,
//                               child: Icon(
//                                 Icons.person,
//                                 size: 100,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                   Positioned(
//                     right: -16,
//                     bottom: 0,
//                     child: SizedBox(
//                       height: 46,
//                       width: 46,
//                       child: TextButton(
//                         style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                             side: const BorderSide(color: Colors.white),
//                           ),
//                           backgroundColor: Colors.red,
//                         ),
//                         onPressed: () => displayMessage(context),
//                         //pickImage(),
//                         child: SvgPicture.asset("assets/icons/pencil.svg",
//                             height: 20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const TextField(
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                   labelText: "Full name",
//                   labelStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   hintText: "FullName",
//                   hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   )),
//             ),
//             SizedBox(
//               height: size.height / 37.5,
//             ),
//             const TextField(
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                   labelText: "UserName",
//                   labelStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   hintText: "UserName",
//                   hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   )),
//             ),
//             SizedBox(
//               height: size.height / 37.5,
//             ),
//             const TextField(
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                   labelText: "PhoneNumber",
//                   labelStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   hintText: "PhoneNumber",
//                   hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   )),
//             ),
//             SizedBox(height: size.height / 37.5),
//             const TextField(
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                   labelText: "Email",
//                   labelStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   hintText: "Enter your email",
//                   hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1),
//                   )),
//             ),
//             SizedBox(height: size.height / 37.5),
//             const TextField(
//               cursorColor: Colors.black,
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 labelStyle: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400),
//                 hintText: "Enter your password",
//                 hintStyle: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1),
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1),
//                 ),
//               ),
//             ),
//             SizedBox(height: size.height / 37.5),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   width: size.width / 3.4,
//                   height: size.height / 16,
//                   child: TextButton(
//                     onPressed: () => {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Updateprofilepage())),
//                     },
//                     child: const Text(
//                       "Update",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: size.width / 3.4,
//                   height: size.height / 16,
//                   child: TextButton(
//                     onPressed: () => {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Updateprofilepage())),
//                     },
//                     child: const Text(
//                       "Cancel",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             )
//           ]),
//         ),
//       ),
//     );
//   }

//   void displayMessage(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           insetPadding: const EdgeInsets.all(10),
//           //title: const Text("Password Changed"),
//           content: Container(
//             width: double.infinity,
//             height: size.height / 5,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15), color: Colors.white),
//             child: Column(
//               children: [
//                 Padding(padding: EdgeInsets.only(top: size.height / 35)),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.5),
//                         spreadRadius: 1.5,
//                         blurRadius: 2,
//                         offset:
//                             const Offset(0, 1.5), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextButton(
//                       onPressed: pickImage,
//                       child: Row(
//                         children: const [
//                           Icon(Icons.photo),
//                           SizedBox(width: 20),
//                           Text("Gallery")
//                         ],
//                       )),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.5),
//                         spreadRadius: 1.5,
//                         blurRadius: 2,
//                         offset:
//                             const Offset(0, 1.5), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextButton(
//                       onPressed: pickImageviacamera,
//                       child: Row(
//                         children: const [
//                           Icon(Icons.camera),
//                           SizedBox(width: 20),
//                           Text("Camera")
//                         ],
//                       )),
//                 )
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context, rootNavigator: true).pop('dialog');
//                 },
//                 child: const Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.black),
//                 ))
//           ],
//         );
//       },
//     );
//   }
// }
