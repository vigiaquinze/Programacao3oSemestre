import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Página com ListView'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Nome',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text('Luise Inácie Lule de Silve'),
                  ),
                  ListTile(
                    title: Text(
                      'Data de Nascimento',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text('27/10/1945'),
                  ),
                  ListTile(
                    title: Text(
                      'Filhos',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(
                        'Lurian Cordeiro Lula da Silva, Sandro Luís, Marcos Cláudio Lula da Silva, Luís Cláudio, Fábio Luís Lula da Silva'),
                  ),
                  ListTile(
                    title: Text(
                      'Partido',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text('Partido dos Trabalhadores'),
                  ),
                  ListTile(
                    title: Text(
                      'Cônjuge',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text('Janja Lula da Silva'),
                  ),
                  ListTile(
                    title: Text(
                      'Mandatos presidenciais',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(
                        '1 de janeiro de 2023 –, 1 de janeiro de 2003 – 1 de janeiro de 2011'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
