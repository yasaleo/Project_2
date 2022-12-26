import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  File? finalImage;

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.COLOR_SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: 200,
              color: Constants.COLOR_ORANGISH,
            );
          },
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
