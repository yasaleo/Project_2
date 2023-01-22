import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CustomSlideAnimation extends StatelessWidget {
  const CustomSlideAnimation(
      {super.key,
      required this.child,
      required this.intialInteval,
      required this.animation});
  final Widget child;
  final double intialInteval;
  final Animation<double> animation;


  @override
  Widget build(BuildContext context) {
   
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
                  .animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(intialInteval, 1, curve: Curves.easeOutCubic),
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
