// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:livin_sweaty/models/plans.dart';
// import 'package:provider/provider.dart';
// import '';
// import '../../../../constants/error_handling.dart';
// import '../../../../constants/utils.dart';
// import '../../../../providers/user_provider.dart';

// class PlanServices {
//   void addProgress({
//     required BuildContext context,
//     required List<Plans> images,
//   }) async {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     try {
//       http.Response res = await http.post(
//         Uri.parse("$uri/auth/add-waterIntake"),
//         headers: {
//           'Content-Type': 'application/json; charset=utf-8',
//           'x-auth-token': userProvider.user.token,
//         },
//         body: jsonEncode({
//           'waterIntake': waterIntake,
//         }),
//       );

//       httpErrorHandle(
//         response: res,
//         context: context,
//         onSucess: () {},
//       );
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
// }
