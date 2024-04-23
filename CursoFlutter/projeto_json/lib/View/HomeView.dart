import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [ElevatedButton(onPressed: (), child: Text('Cadastrar'))],
          ),
        ),
      ),
    );
  }
}
