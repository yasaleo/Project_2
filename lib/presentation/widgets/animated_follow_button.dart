import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AnimatedFollwButton extends StatefulWidget {
  const AnimatedFollwButton({super.key});

  @override
  State<AnimatedFollwButton> createState() => _AnimatedFollwButtonState();
}

class _AnimatedFollwButtonState extends State<AnimatedFollwButton> {
  bool isFollowing = false;
  String follow = " Follow ";
  String unfollow = "Unfollow";

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      // switchInCurve: Curves.easeInBack,
      // switchOutCurve: Curves.easeInBack,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        key: UniqueKey(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: Constants().BORDERCURVE,
            side: const BorderSide(
              color: Constants.COLOR_WHITE,
            ),
          ),
          backgroundColor:
              isFollowing ? Constants.COLOR_BLACK : Constants.COLOR_WHITE,
        ),
        onPressed: () {
          setState(() {
            isFollowing = !isFollowing;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            isFollowing ? unfollow : follow,
            key: UniqueKey(),
            style: TextStyle(
              color:
                  isFollowing ? Constants.COLOR_WHITE : Constants.COLOR_BLACK,
            ),
          ),
        ),
      ),
    );
  }
}
