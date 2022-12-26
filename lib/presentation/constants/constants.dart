// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const COLOR_BLUE = Color.fromARGB(255, 162, 229, 223);
  static const COLOR_BLACK = Color.fromARGB(255, 0, 0, 0);
  static const COLOR_SEMIBLACK = Color.fromARGB(150, 0, 0, 0);
  static const COLOR_SCAFFOLD_BACKGROUND = Color.fromARGB(255, 0, 0, 0);


  static const COLOR_WHITE = Color.fromARGB(255, 255, 255, 255);
  static const COLOR_PINKISH = Color.fromARGB(255, 255, 212, 213);
  static const COLOR_GREYISH = Color.fromARGB(255, 61, 61, 61);
  static const COLOR_REDISH = Color.fromARGB(255, 129, 17, 17);
  static const COLOR_GREENISH = Color.fromARGB(255, 8, 67, 6);
  static const COLOR_ORANGISH = Color.fromARGB(255, 255, 150, 101);

  //
  static const double STROKETHICK = 2.9;
  static const HEIGHT10 = SizedBox(
    height: 10,
  );
  static const HEIGHT20 = SizedBox(
    height: 20,
  );
  static const HEIGHT30 = SizedBox(
    height: 30,
  );
  static const HEIGHT50 = SizedBox(
    height: 50,
  );

  //
    static const WIDTH10 = SizedBox(
    width: 10,
  );
  static const WIDTH20 = SizedBox(
    width: 20,
  );
  static const WIDTH30 = SizedBox(
    width: 30,
  );
  static const WIDTH50 = SizedBox(
    width: 50,
  );


  BorderRadiusGeometry BORDERCURVE = BorderRadius.circular(8);
  //loading widget
  showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black12,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Constants.COLOR_WHITE,
            strokeWidth: 7,
          ),
        );
      },
    );
  }
}
