import 'package:flutter/material.dart';

import 'package:livin_sweaty/features/account/profile/screens/profile_picture.dart';
import 'package:livin_sweaty/features/account/services/profile_services.dart';

import 'screens/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const ProfilePicture(),
            const SizedBox(
              height: 30,
            ),
            ProfileMenu(
              icon: const Icon(Icons.person_outline),
              press: () {},
              text: 'My Account',
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              icon: const Icon(Icons.help_outline_rounded),
              press: () {},
              text: 'Help Center',
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              icon: const Icon(Icons.settings),
              press: () {},
              text: 'Settings',
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              icon: const Icon(Icons.logout),
              press: () => AccountServices().logOut(context),
              text: 'Logout',
            ),
          ],
        ));
  }
}
