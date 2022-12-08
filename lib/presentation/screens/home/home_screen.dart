import 'package:flutter/material.dart';
import 'package:project_2/presentation/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text(
          "Home ",
          style: TextStyle(
              color: Constants.COLOR_WHITE,
            )
        ),
      ),
      body: const Center(
        child: Text(
          "Home",
          style: TextStyle(
            color: Constants.COLOR_WHITE,
          ),
        ),
      ),
    );
  }
}
