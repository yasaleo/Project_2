import 'package:flutter/material.dart';

import 'package:project_2/presentation/constants/constants.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.cwidget,
    required this.onTap,
     this.height=50,
     this.width=50,
  });
  final Widget cwidget;
  final Function onTap;
  final double height;
  final double width;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool iselvated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Listener(
        onPointerUp: (event) => setState(() => iselvated = true),
        onPointerDown: (event) => setState(() => iselvated = false),
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
              border: Border.all(width: Constants.STROKETHICK),
              color: Constants.COLOR_WHITE,
              borderRadius: Constants().BORDERCURVE,
              boxShadow: iselvated
                  ? [
                      const BoxShadow(
                        color: Constants.COLOR_BLACK,
                        offset: Offset(5, 5),
                      ),
                    ]
                  : null),
          child: Center(child: widget.cwidget),
        ),
      ),
    );
  }
}
