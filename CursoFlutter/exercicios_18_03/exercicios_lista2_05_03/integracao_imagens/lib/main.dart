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
    return MaterialApp(
// Configura a tela inicial como um Scaffold
      home: Scaffold(
          appBar: AppBar(
// Título da barra superior
            title: Text('Integração de Imagens'),
          ),
          body: Column(
            children: [
              Image(
                image: AssetImage('../images/wwdc6.jpg'),
                width: 500,
              )
            ],
          )),
    );
  }
}
