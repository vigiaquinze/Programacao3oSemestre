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
    return MaterialApp(
// Configura a tela inicial como um Scaffold
        home: Scaffold(
            appBar: AppBar(
// Título da barra superior
              title: Text('Organização com Rows e Columns'),
            ),
            body: Column(children: [
              Container(
                  child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth * 0.4, 0, 0, 0)),
                  Text('Rows', style: TextStyle(fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Icon(
                    Icons.line_axis_rounded,
                    color: const Color.fromARGB(255, 40, 40, 40),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                    'Terceiro Item',
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              )),
              Text(
                'Columns',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.access_alarm, color: Colors.black87),
              Text(
                'Terceiro Item',
                style: TextStyle(color: Colors.amberAccent),
              )
            ])));
  }
}
