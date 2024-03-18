import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que herda de StatelessWidget
class MyApp extends StatelessWidget {
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
    // Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);
// Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;
    // Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;
    return MaterialApp(
// Configura a tela inicial como um Scaffold
        home: Scaffold(
            appBar: AppBar(
// Título da barra superior
              title: Text('Layout Responsivo com MediaQuery'),
            ),
            body: Column(children: [
              Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.25,
                  padding: EdgeInsets.all(16.0),
                  color: Color.fromARGB(255, 255, 0, 89),
                  child: Text(
                    'Power Guido',
                    style: TextStyle(
                        fontSize: textSize,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  padding: EdgeInsets.all(16.0),
                  color: Color.fromARGB(255, 0, 149, 75),
                  child: Text(
                    'Agora',
                    style: TextStyle(
                        fontSize: textSize,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.75,
                  padding: EdgeInsets.all(16.0),
                  color: Color.fromARGB(255, 238, 255, 0),
                  child: Text(
                    'Ficou bom',
                    style: TextStyle(
                        fontSize: textSize,
                        color: Color.fromARGB(255, 40, 40, 40)),
                    textAlign: TextAlign.center,
                  )),
            ])));
  }
}
