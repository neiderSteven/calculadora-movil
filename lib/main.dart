import 'package:flutter/material.dart';

import 'package:parcial/screen/screen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: ScreenPage(),
    );
  }
}