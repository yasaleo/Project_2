import 'package:flutter/material.dart';
import 'package:project_2/presentation/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Profile",
            style: TextStyle(
              color: Constants.COLOR_WHITE,
            )),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
