import 'package:flutter/material.dart';

import 'constants/constants.dart';

class NeubrutContainer extends StatelessWidget {
  const NeubrutContainer({
    Key? key,
    required this.child,
    this.height = 30,
    this.width = 30,
    this.color= Constants.COLOR_WHITE
  }) : super(key: key);

  final double height;
  final double width;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: Constants.STROKETHICK,
          ),
          borderRadius: Constants().BORDERCURVE,
          boxShadow: const [
            BoxShadow(color: Constants.COLOR_BLACK, offset: Offset(5, 5))
          ]),
      height: height,
      width: width,
      child: child,
    );
  }
}
