import 'package:flutter/material.dart';

import 'package:parcial/screen/aritmeticas_screen.dart';
import 'package:parcial/screen/logicas_screen.dart';
import 'package:parcial/screen/programacion_screen.dart';

class ScreenPage extends StatefulWidget {
  ScreenPage({Key? key}) : super(key: key);

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    Widget content = ProgramacionScreen();

    if (_currentIndex == 1) {
      content = AritmeticasSreen();
    } else if (_currentIndex == 2) {
      content = LogicaScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: content,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: itemsBottonNavigationBar(),
      ),
    );
  }

  itemsBottonNavigationBar() {
    return [
      BottomNavigationBarItem(
        label: "Programación",
        icon: Icon(
          Icons.receipt,
          size: 16,
        ),
      ),
      BottomNavigationBarItem(
        label: "Aritmeticas",
        icon: Icon(
          Icons.add_alert,
          size: 16,
        ),
      ),
      BottomNavigationBarItem(
        label: "Operadores",
        icon: Icon(
          Icons.android,
          size: 16,
        ),
      ),
    ];
  }
}
