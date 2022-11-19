import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TextBold extends StatelessWidget {
  const TextBold({
    Key? key,
    required this.content,  this.fontsize= 48,
  }) : super(key: key);
  final String content;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style:  TextStyle(
        fontSize: fontsize,
        fontFamily: 'Source Code Pro Black',
        color: Constants.COLOR_BLACK,
      ),
    );
  }
}

class TextSemiBold extends StatelessWidget {
  const TextSemiBold({
    Key? key,
    required this.content,
    this.size = 20,
  }) : super(key: key);
  final String content;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Source Code Pro Semi',
        color: Constants.COLOR_BLACK,
      ),
    );
  }
}
