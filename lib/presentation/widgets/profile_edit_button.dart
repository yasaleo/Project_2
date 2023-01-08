import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'constants/constants.dart';

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Constants.COLOR_GREYISH,
      radius: 19.7,
      child: CircleAvatar(
        backgroundColor: Constants.COLOR_BLACK,
        radius: 17,
        child: Icon(
          Ionicons.pencil,
          color: Constants.COLOR_WHITE,
          size: 13,
        ),
      ),
    );
  }
}
