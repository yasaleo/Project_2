import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TextBold extends StatelessWidget {
  const TextBold({
    Key? key,
    required this.content,
    this.fontsize = 48,
    this.color = Constants.COLOR_BLACK

  }) : super(key: key);
  final String content;
  final double fontsize;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: 'Source Code Pro Black',
        color: color,
      ),
    );
  }
}

class TextSemiBold extends StatelessWidget {
  const TextSemiBold({
    Key? key,
    required this.content,
    this.fontsize = 20,
    this.color = Constants.COLOR_BLACK
  }) : super(key: key);
  final String content;
  final double? fontsize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: 'Source Code Pro Semi',
        color: color,

      ),
    );
  }
}
