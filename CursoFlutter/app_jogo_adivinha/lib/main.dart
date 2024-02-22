import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(CalculadoraApp());
}


class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}


class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}


class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  String _resultado = '';
  int numeroSorteado = Random().nextInt(99)+1;
  bool acertou = false;
  int cont = 0;

  void _adivinhar(){
    int numero = int.tryParse(_controllerNumero1.text) as int;

    setState(() {
      cont++;
      if(numero==numeroSorteado){
        _resultado = 'Você acertou em $cont tentativas!';
        acertou=true;
      }
      else if(numero>numeroSorteado){
        _resultado = 'Você errou! Tente um número menor.';
      }
      else{
        _resultado = 'Você errou! Tente um número maior.';
      }
    });
  }

  void _reiniciar(){
    setState(() {
      acertou = false;
      _resultado = '';
      _controllerNumero1.text = '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo Adivinhação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um número:'),
            ),
            SizedBox(height: 10.0),
            if(!acertou)
            ElevatedButton(
              onPressed: () => _adivinhar(),
              child: Text('Adivinhar'),
            ),
            Visibility(
              visible: acertou,
              child: ElevatedButton(
              onPressed: () => _reiniciar(),
              child: Text('Reiniciar'),
            ),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
