import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextfeild extends StatelessWidget {
  const CustomTextfeild({
    Key? key,
    required this.hintText,
    required this.icon,
    this.focusnode,
    this.onchanged,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final Widget icon;
  final FocusNode? focusnode;
  final Function(String)? onchanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 370,
      child: Stack(
        children: [
          Positioned(
            bottom: 13,
            left: 5.5,
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                color: Constants.COLOR_WHITE,
                border: Border.all(
                  width: Constants.STROKETHICK,
                ),
                borderRadius: Constants().BORDERCURVE,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: 350,
            child: TextFormField(
              onChanged: (value) {
                onchanged!(value);
              },
              controller: controller,
              focusNode: focusnode,
              decoration: InputDecoration(
                  
                  hintText: hintText,
                  filled: true,
                  fillColor: Constants.COLOR_WHITE,
                  suffixIcon: icon,
                  
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: Constants.STROKETHICK,
                      color: Constants.COLOR_BLACK,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: Constants.STROKETHICK,
                      color: Constants.COLOR_BLACK,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
