import 'package:flutter/material.dart';

import 'constants/constants.dart';

class AnimatedFollwButton extends StatefulWidget {
  bool isFollowing;
  final GestureTapCallback onClick;

  AnimatedFollwButton(
      {super.key, this.isFollowing = false, required this.onClick});

  @override
  State<AnimatedFollwButton> createState() => _AnimatedFollwButtonState();
}

class _AnimatedFollwButtonState extends State<AnimatedFollwButton> {
  String follow = " Follow ";
  String unfollow = "Unfollow";

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
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
          backgroundColor: widget.isFollowing
              ? Constants.COLOR_BLACK
              : Constants.COLOR_WHITE,
        ),
        onPressed: () {
          widget.onClick();
          setState(() {
            widget.isFollowing = !widget.isFollowing;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            widget.isFollowing ? unfollow : follow,
            key: UniqueKey(),
            style: TextStyle(
              color: widget.isFollowing
                  ? Constants.COLOR_WHITE
                  : Constants.COLOR_BLACK,
            ),
          ),
        ),
      ),
    );
  }
}
