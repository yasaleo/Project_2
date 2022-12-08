import 'package:flutter/material.dart';


import '../../constants/constants.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Events",
            style: TextStyle(
              color: Constants.COLOR_WHITE,
            )),
      ),
      body: const Center(
        child: Text("Events page",
            style: TextStyle(
              color: Constants.COLOR_WHITE,
            )),
      ),
    );
  }
}
