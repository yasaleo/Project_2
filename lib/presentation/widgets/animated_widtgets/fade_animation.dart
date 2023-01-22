import 'dart:developer';

import 'package:flutter/material.dart';

class CustomFadeAnimation extends StatefulWidget {
  const CustomFadeAnimation({
    super.key,
    required this.child,
  });
  final Widget child;
  // final double intialInteval;

  @override
  State<CustomFadeAnimation> createState() => _CustomFadeAnimationState();
}

class _CustomFadeAnimationState extends State<CustomFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
