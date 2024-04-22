import 'package:flutter/material.dart';
import 'View/PaginaInicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistência de Dados',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: HomePage(),
    );
  }
}