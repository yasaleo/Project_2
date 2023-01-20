import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class OtpFeild extends StatelessWidget {
  const OtpFeild(
      {Key? key, this.last = false, this.first = false, this.controller})
      : super(key: key);
  final bool last;
  final bool first;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final desize = MediaQuery.of(context).size;

    return SizedBox(
      height: desize.height * .6 / 10,
      width: desize.width * 1 / 10,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        cursorColor: Constants.COLOR_BLACK,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: const TextStyle(fontSize: 18),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: Constants.STROKETHICK,
              color: Constants.COLOR_BLACK,
            ),
          ),
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
          ),
        ),
      ),
    );
  }
}
