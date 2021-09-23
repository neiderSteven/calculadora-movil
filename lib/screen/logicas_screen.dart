import 'package:flutter/material.dart';

class LogicaScreen extends StatefulWidget {
  LogicaScreen({Key? key}) : super(key: key);

  @override
  _LogicaScreenState createState() => _LogicaScreenState();
}

class _LogicaScreenState extends State<LogicaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('operadores logicos'),
      ),
    );
  }
}