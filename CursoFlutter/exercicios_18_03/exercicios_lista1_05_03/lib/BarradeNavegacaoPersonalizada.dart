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
        theme: ThemeData(
          useMaterial3: true,

          // Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            // ···
            brightness: Brightness.dark,
          ),
        ),
// Configura a tela inicial como um Scaffold
        home: Scaffold(
          appBar: AppBar(
// Título da barra superior
            title: Text('Barra de Navegação Personalizada'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.account_balance_wallet_sharp,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                            "Tudo certo",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      });
                },
              )
            ],
            backgroundColor: Color.fromARGB(255, 179, 0, 255),
          ),
          body: Column(
            children: [],
          ),
        ));
  }
}
