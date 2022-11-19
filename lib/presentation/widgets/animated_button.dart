import 'package:flutter/material.dart';

import 'package:project_2/presentation/constants/constants.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.cwidget, required this.onTap});
  final Widget cwidget;
  final Function onTap;

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
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
              border: Border.all(width: 1.8),
              color: Constants.COLOR_WHITE,
              borderRadius: BorderRadius.circular(8),
              boxShadow: iselvated
                  ? [
                      const BoxShadow(
                        color: Constants.COLOR_BLACK,
                        offset: Offset(5, 5),
                      ),
                    ]
                  : null),
          child: widget.cwidget,
        ),
      ),
    );
  }
}
