import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que herda de StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo de TabBar'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.account_circle_outlined),
              ),
              Tab(
                icon: Icon(Icons.account_balance_wallet_outlined),
              ),
              Tab(
                icon: Icon(Icons.airplane_ticket_outlined),
              ),
              Tab(
                icon: Icon(Icons.remove_circle_outline_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Dados do meu perfil"),
            ),
            Center(
              child: Text("Dados da carteira"),
            ),
            Center(
              child: Text("Dados de viagens"),
            ),
            Center(
              child: Text("Remover dados"),
            ),
          ],
        ),
      ),
    );
  }
}
