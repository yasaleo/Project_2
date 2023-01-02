import 'package:flutter/material.dart';
import 'package:project_2/presentation/constants/constants.dart';

import '../widgets/user_tile.dart';

class FollowingListScreen extends StatelessWidget {
  const FollowingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BLACK,
      appBar: AppBar(
        backgroundColor: Constants.COLOR_BLACK,
        title: const Text("Following", style: Constants.TEXTSTYLE_WHITE),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const UserTile();
        },
        itemCount: 15,
      ),
    );
  }
}


