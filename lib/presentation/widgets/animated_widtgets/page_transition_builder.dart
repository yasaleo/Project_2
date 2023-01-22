import 'package:flutter/material.dart';

class CustomPageRoute {
  Route animatedRouteBuilder({required RoutePageBuilder pageBuilder}) {
    return PageRouteBuilder(
      barrierColor: Colors.white,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 500),

      pageBuilder: (context, animation, secondaryAnimation) => pageBuilder(context,animation,secondaryAnimation),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset(0, 0);
        const curve = Curves.easeInOutCirc;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
