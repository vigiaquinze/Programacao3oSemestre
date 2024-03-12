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
              title: Text('Menu de Opções (Drawer)'),
            ),
            drawer: Drawer(
              child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 0, 89),
                      ),
                      child: Text(
                        'Header do Drawer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      title: const Text('Item 1'),
                      onTap: () {
                        const snackBar = SnackBar(content: Text('Tap'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    ListTile(
                      title: const Text('Item 2'),
                      onTap: () {
                        const snackBar = SnackBar(content: Text('Tap'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ]),
            )));
  }
}
