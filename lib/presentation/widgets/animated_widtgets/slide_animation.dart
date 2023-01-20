import 'package:flutter/cupertino.dart';

class CustomSlideAnimation extends StatefulWidget {
  const CustomSlideAnimation(
      {super.key, required this.child, required this.intialInteval});
  final Widget child;
  final double intialInteval;

  @override
  State<CustomSlideAnimation> createState() => _CustomSlideAnimationState();
}

class _CustomSlideAnimationState extends State<CustomSlideAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation =
        Tween<Offset>(begin: const Offset(-1.6, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(widget.intialInteval, 1, curve: Curves.linearToEaseOut),
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: animation,
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
