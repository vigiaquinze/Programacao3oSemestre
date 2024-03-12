import 'dart:math';

import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que desta vez herda de StatefulWidget, para desta vez ter um estado que será usado no createState()
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define as propriedades padrão do objeto
  double _largura = 50;
  double _altura = 50;
  Color _cor = Color.fromARGB(255, 255, 0, 98);
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  Widget build(BuildContext context) {
    AnimatedContainer(
      // Usa as propriedades armazenadas no estado da classe
      width: _largura,
      height: _altura,
      decoration: BoxDecoration(
        color: _cor,
        borderRadius: _borderRadius,
      ),
      // Definindo o quanto a animação irá durar.
      duration: const Duration(seconds: 1),
      // Adicionando um método de curva para a animação, para ela parecer mais suave.
      curve: Curves.fastOutSlowIn,
    );
    return MaterialApp(
// Configura a tela inicial como um Scaffold
      home: Scaffold(
        appBar: AppBar(
// Título da barra superior
          title: Text('Widget Animado'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _largura,
            height: _altura,
            decoration: BoxDecoration(
              color: _cor,
              borderRadius: _borderRadius,
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Quando o usuário aperta o botão de 'play'
          onPressed: () {
            // Usando setState() para rearmazenar as propriedades do widget.
            setState(() {
              // Cria um gerador aleatório.
              final random = Random();

              // Gera largura e altura aleatoriamente.
              _largura = random.nextInt(300).toDouble();
              _altura = random.nextInt(300).toDouble();

              // Gera uma cor aleatória usando cada cor do espectro RGB em valores aleatórios.
              _cor = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Gera um "border radius" aleatório.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
