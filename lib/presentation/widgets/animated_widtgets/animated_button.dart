import 'package:flutter/material.dart';

import 'package:project_2/presentation/widgets/constants/constants.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton(
      {super.key,
      required this.cwidget,
      required this.onTap,
      this.height = 50,
      this.width = 50,
      this.isLoading = false});
  final Widget cwidget;
  final Function onTap;
  final double height;
  final double width;
  final bool isLoading;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool iselvated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isLoading ? null : widget.onTap();
      },
      child: Listener(
        onPointerUp: (event) => setState(() => iselvated = true),
        onPointerDown: (event) => setState(() => iselvated = false),
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(
              border: Border.all(width: Constants.STROKETHICK),
              color: Constants.COLOR_WHITE,
              borderRadius: Constants().BORDERCURVE,
              boxShadow: iselvated
                  ? [
                      BoxShadow(
                        color: widget.isLoading
                            ? Colors.transparent
                            : Constants.COLOR_BLACK,
                        offset: const Offset(6.5, 6.5),
                      ),
                    ]
                  : null),
          child: Center(
            child: AnimatedSwitcher(
              switchInCurve: Curves.easeInOutBack,
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              duration: const Duration(milliseconds: 250),
              child: widget.isLoading
                  ? Padding(
                      key: UniqueKey(),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Constants.CIRCULARINDICATOR_BLACK)
                  : widget.cwidget,
            ),
          ),
        ),
      ),
    );
  }
}
