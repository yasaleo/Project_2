import 'package:flutter/material.dart';
import 'package:project_2/presentation/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Profile",
            style: TextStyle(
              color: Constants.COLOR_WHITE,
            )),
      ),
      body: const Center(
          child: Text("Profile",
              style: TextStyle(
                color: Constants.COLOR_WHITE,
              ))),
    );
  }
}
