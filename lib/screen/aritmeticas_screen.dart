import 'package:flutter/material.dart';

class AritmeticasSreen extends StatefulWidget {
  AritmeticasSreen({Key? key}) : super(key: key);

  @override
  _AritmeticasSreenState createState() => _AritmeticasSreenState();
}

class _AritmeticasSreenState extends State<AritmeticasSreen> {
  @override
  Widget build(BuildContext context) {
    String binary1 = '';
    String binary2 = '';

    return myForm(binary1, binary2, context);
  }

  Form myForm(String binary1, String binary2, BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              onChanged: (binario1) {
                binary1 = binario1;
              },
              decoration: InputDecoration(
                  labelText: 'Escriba el numero binario',
                  prefixIcon: Icon(Icons.format_list_numbered)),
            ),
            TextFormField(
              autocorrect: false,
              onChanged: (binario2) {
                binary2 = binario2;
              },
              decoration: InputDecoration(
                  labelText: 'Escriba el numero binario',
                  prefixIcon: Icon(Icons.format_list_numbered)),
            ),
            SizedBox(height: 15),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text('Sumar'),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => _convertir('suma', binary1, binary2),
                  );
                }),
            SizedBox(height: 15),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text('Restar'),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => _convertir('resta', binary1, binary2),
                  );
                }),
          ],
        ));
  }

  Widget _convertir(numero, binary1, binary2) {
    var valor;

    if (numero == 'suma') {
      var testC = int.parse(binary1, radix: 2) + int.parse(binary2, radix: 2);
      valor = BigInt.from(testC).toUnsigned(8).toRadixString(2);
    }
    if (numero == 'resta') {
      var testC = int.parse(binary1, radix: 2) - int.parse(binary2, radix: 2);
      valor = BigInt.from(testC).toUnsigned(8).toRadixString(2);
    }

    return myAlert(valor);
  }

  AlertDialog myAlert(valor) {
    return AlertDialog(
      title: Text('Resultado'),
      content: Text("Valor: ${valor}"),
      actions: <Widget>[
        TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
