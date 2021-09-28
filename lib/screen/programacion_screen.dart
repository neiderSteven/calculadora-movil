import 'package:flutter/material.dart';
import 'package:any_base/any_base.dart';

class ProgramacionScreen extends StatefulWidget {
  ProgramacionScreen({Key? key}) : super(key: key);

  @override
  _ProgramacionScreenState createState() => _ProgramacionScreenState();
}

class _ProgramacionScreenState extends State<ProgramacionScreen> {
  @override
  Widget build(BuildContext context) {

    String valor = '';
    String propiedad = 'octal';

    return myForm(valor, propiedad, context);
  }

  Form myForm(String valor, String propiedad, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            onChanged: (valorOctal) {
              valor = valorOctal;
              propiedad = 'octal';
            },
            decoration: InputDecoration(
                labelText: 'Escriba el Octal',
                prefixIcon: Icon(Icons.format_list_numbered)),
          ),
          TextFormField(
            autocorrect: false,
            onChanged: (valorOctal) {
              valor = valorOctal;
              propiedad = 'hexadecimal';
            },
            decoration: InputDecoration(
                labelText: 'Escriba el hexadecimal',
                prefixIcon: Icon(Icons.format_list_numbered)),
          ),
          TextFormField(
            autocorrect: false,
            onChanged: (valorOctal) {
              valor = valorOctal;
              propiedad = 'binario';
            },
            decoration: InputDecoration(
                labelText: 'Escriba el Binario',
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
                child: Text('Covertir a Octal'),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => _convertir(0, valor, propiedad),
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
                child: Text('Covertir a binario'),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => _convertir(1, valor, propiedad),
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
                child: Text('Covertir a hexadecimal'),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => _convertir(2, valor, propiedad),
                );
              })
        ],
      ));
  }

  Widget _convertir(numero, valor, propiedad) {
    const binToOct = AnyBase(AnyBase.bin, AnyBase.oct);
    const binToHex = AnyBase(AnyBase.bin, AnyBase.hex);
    const octToHex = AnyBase(AnyBase.oct, AnyBase.hex);

    if (propiedad == 'octal') {
      if (numero == 1) {
        valor = binToOct.revert(valor);
      } else {
        valor = octToHex.convert(valor);
      }
    }
    if (propiedad == 'binario') {
      if (numero == 0) {
        valor = binToOct.convert(valor);
      } else {
        valor = binToHex.convert(valor);
      }
    }
    if (propiedad == 'hexadecimal') {
      if (numero == 1) {
        valor = binToHex.revert(valor);
      } else {
        valor = octToHex.revert(valor);
      }
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