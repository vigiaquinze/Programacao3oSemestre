import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaOlaMundo(),
    );
  }
}

class TelaOlaMundo extends StatefulWidget {
  @override
  _TelaOlaMundoState createState() => _TelaOlaMundoState();
}

class _TelaOlaMundoState extends State<TelaOlaMundo> {
  final TextEditingController _controllerNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alex Pai Solteiro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Digite seu nome:'),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _controllerNome,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nome = _controllerNome.text;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Olá, $nome!')),
                );
              },
              child: Text('Clique para saudar'),
            ),
          ],
        ),
      ),
    );
  }
}


