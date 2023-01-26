// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
  //------------textStyle____________________
  static const TEXTSTYLE_WHITE = TextStyle(color: Constants.COLOR_WHITE);
  static const TEXTSTYLE_BLACK = TextStyle(color: Constants.COLOR_BLACK);

//__________SIZEDBOX________________________
  static const HEIGHT10 = SizedBox(height: 10);
  static const HEIGHT20 = SizedBox(height: 20);
  static const HEIGHT30 = SizedBox(height: 30);
  static const HEIGHT50 = SizedBox(height: 50);

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
  //_____________________circularprogress-indicator______________________
  static const CIRCULARINDICATOR_WHITE = Center(
    child: CircularProgressIndicator(
      color: Constants.COLOR_WHITE,
      strokeWidth: 7,
    ),
  );
  static const CIRCULARINDICATOR_BLACK = Center(
    child: CircularProgressIndicator(
      color: Constants.COLOR_BLACK,
      strokeWidth: 7,
    ),
  );

  //_____________________linearprogress-indicator______________________


  static const LINEARINDICATOR_BLACK = LinearProgressIndicator(
    color: Constants.COLOR_BLACK,
    minHeight: 6,
  );

  //______________________Acess Token___________________________
  static String ACCESSTOKEN =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mbyI6eyJpZCI6IjYzYzQwOTA3MzEzNjc5NTA2M2JhN2I2YSJ9LCJpYXQiOjE2NzM3OTE3NTEsImV4cCI6MTY3Mzg3ODE1MX0.wLO41NijdGVAb72llRzGn2JwWOTURYuDoMEn5MXaysY';

  //_________________border CUrve_____________________________________

  BorderRadiusGeometry BORDERCURVE = BorderRadius.circular(8);

  //______________________loading widget__________________________
  showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black12,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: CircularProgressIndicator(
              color: Constants.COLOR_WHITE,
              strokeWidth: 7,
            ),
          ),
        );
      },
    );
  }

//_________________________________snackbars______________________________________
  showFailedSnackbar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Constants.COLOR_REDISH,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Icon(
              Ionicons.alert_circle,
              color: Constants.COLOR_REDISH,
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSide(
            color: Constants.COLOR_REDISH,
            width: 3,
          ),
        ),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Constants.COLOR_WHITE,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  showSucessSnackbar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Constants.COLOR_GREENISH,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Icon(
              Ionicons.happy,
              color: Constants.COLOR_GREENISH,
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          side: BorderSide(
            color: Constants.COLOR_GREENISH,
            width: 3,
          ),
        ),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Constants.COLOR_WHITE,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
