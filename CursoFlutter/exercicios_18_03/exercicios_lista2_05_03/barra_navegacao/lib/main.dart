import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(BarraDeProgresso());
}

// Definindo a classe MyApp que herda de StatefulWidget
class BarraDeProgresso extends StatefulWidget {
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// Configura a tela inicial como um Scaffold
        home: Scaffold(
      appBar: AppBar(
// Título da barra superior
        title: Text('Barra de Progresso Dinâmica'),
      ),
      body: Column(),
    ));
  }
}
