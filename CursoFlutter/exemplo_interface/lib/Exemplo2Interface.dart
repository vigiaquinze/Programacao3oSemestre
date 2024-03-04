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
title: Text('Presidente do Brasil'),
),
// Corpo da tela, composto por um Column (coluna vertical) de widgets
body: Column(
children: [
// Texto simples como primeiro filho da coluna
Row(
  children: [
Padding(padding: EdgeInsets.all(16.0)),
Icon(Icons.phone, color: Colors.pink, size: 24.0),
Padding(padding: EdgeInsets.all(4.0)),
Text('Nome:', style: TextStyle(fontWeight: FontWeight.bold)),
Padding(padding: EdgeInsets.all(4.0)),
Text('Luise Inácie Lule de Silve'),
  ]
),
Row(
  children: [
Padding(padding: EdgeInsets.all(16.0)),
Icon(Icons.phone, color: Colors.pink, size: 24.0),
Padding(padding: EdgeInsets.all(4.0)),
Text('Idade:', style: TextStyle(fontWeight: FontWeight.bold)),
Padding(padding: EdgeInsets.all(4.0)),
Text('78 anos'),
  ]
),
Row(
  children: [
Padding(padding: EdgeInsets.all(16.0)),
Icon(Icons.phone, color: Colors.pink, size: 24.0),
Padding(padding: EdgeInsets.all(4.0)),
Text('Endereço:', style: TextStyle(fontWeight: FontWeight.bold)),
Padding(padding: EdgeInsets.all(4.0)),
Text('R. Pouso Alegre, 21 - Ipiranga, São Paulo'),
  ]
),
Row(
  children: [
Padding(padding: EdgeInsets.all(16.0)),
Icon(Icons.phone, color: Colors.pink, size: 24.0),
Padding(padding: EdgeInsets.all(4.0)),
Text('Telefone:', style: TextStyle(fontWeight: FontWeight.bold)),
Padding(padding: EdgeInsets.all(4.0)),
Text('(11) 13131-3131'),
  ]
),
Row(
  children: [
Padding(padding: EdgeInsets.all(16.0)),
Icon(Icons.phone, color: Colors.pink, size: 24.0),
Padding(padding: EdgeInsets.all(4.0)),
Text('E-mail:', style: TextStyle(fontWeight: FontWeight.bold)),
Padding(padding: EdgeInsets.all(4.0)),
Text('lule@hotmail.com'),
  ]
),
],
),
),
);
}
}