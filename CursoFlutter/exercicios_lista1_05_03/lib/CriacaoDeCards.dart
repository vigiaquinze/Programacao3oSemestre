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
        title: Text('Criação de Cards'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('../images/wwdc6.jpg'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Novidades',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 48,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          ),
          Card(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('../images/wwdc6.jpg'))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Outros',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 48,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          )
        ],
      ),
    ));
  }
}
