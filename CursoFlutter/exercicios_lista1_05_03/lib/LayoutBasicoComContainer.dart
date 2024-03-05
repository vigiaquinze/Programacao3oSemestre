// Importa o pacote de material Flutter
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
// Retorna um MaterialApp, que é o widget raiz da aplicação Flutter
    return MaterialApp(
// Configura a tela inicial como um Scaffold
      home: Scaffold(
// Barra superior da tela (AppBar)
        appBar: AppBar(
// Título da barra superior
          title: Text('Layout Básico com Containers'),
        ),
// Corpo da tela, composto por um Column (coluna vertical) de widgets
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              alignment: Alignment.center,
              width: screenWidth * 0.5,
              padding: EdgeInsets.all(16.0),
              color: Color.fromARGB(255, 255, 0, 60),
              child: Text(
                'Power Guido',
                style: TextStyle(
                    fontSize: textSize,
                    color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              )),
          Container(
              width: screenWidth * 0.5,
              padding: EdgeInsets.all(16.0),
              color: Color.fromARGB(255, 170, 0, 40),
              child: Text(
                'Agora ficou bom',
                style: TextStyle(
                    fontSize: textSize,
                    color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              )),
          Container(
              width: screenWidth * 0.5,
              padding: EdgeInsets.all(16.0),
              color: Color.fromARGB(255, 82, 0, 19),
              child: Icon(
                Icons.flash_on,
                color: Colors.white,
                size: textSize,
              )),
        ]),
      ),
    );
  }
}
