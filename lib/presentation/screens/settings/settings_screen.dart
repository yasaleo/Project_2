import 'package:flutter/material.dart';
import 'package:project_2/presentation/constants/constants.dart';

class SettingScreeen extends StatelessWidget {
  const SettingScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Settings",style: TextStyle(
              color: Constants.COLOR_WHITE,
            )),
      ),
      body: const Center(
        child: Text(
          'settings Screen',
          style: TextStyle(
            color: Constants.COLOR_WHITE,
          ),
        ),
      ),
    );
  }
}
