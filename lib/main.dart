import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2/presentation/main_screens/default/defaultscreen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorSchemeSeed: Colors.white,
          useMaterial3: true,
          fontFamily: 'Source Code Pro Regular'),
      home: const DefaultScreen(),
    );
  }
}
