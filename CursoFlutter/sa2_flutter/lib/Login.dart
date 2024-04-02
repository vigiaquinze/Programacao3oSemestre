import 'package:flutter/material.dart';
import 'package:sa2_flutter/Cadastro.dart';
import 'package:sa2_flutter/DatabaseController.dart';

class Login extends StatefulWidget {
  final String title = "Login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final dbHelper = DatabaseHelper();
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implementar lógica de login aqui
                },
                child: Text('Entrar na Conta'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro()),
                  );
                },
                child: Text('Criar uma Conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
