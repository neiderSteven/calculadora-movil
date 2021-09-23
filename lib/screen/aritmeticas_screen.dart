import 'package:flutter/material.dart';

class AritmeticasSreen extends StatefulWidget {
  AritmeticasSreen({Key? key}) : super(key: key);

  @override
  _AritmeticasSreenState createState() => _AritmeticasSreenState();
}

class _AritmeticasSreenState extends State<AritmeticasSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('operaciones aritmeticas'),
      ),
    );
  }
}