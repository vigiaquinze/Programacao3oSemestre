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
    // Retorna um MaterialApp, que é o widget raiz da aplicação Flutter
    return MaterialApp(
// Configura a tela inicial como um Scaffold
        home: Scaffold(
// Barra superior da tela (AppBar)
      appBar: AppBar(
// Título da barra superior
        title: Text('Página com ListView'),
      ),
      body: Column(
        children: [
          ListView(
            children: [
              ListTile(
                title: Text('Nome'),
                subtitle: Text('Luise Inácie Lule de Silve'),
                textColor: Colors.black87,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
