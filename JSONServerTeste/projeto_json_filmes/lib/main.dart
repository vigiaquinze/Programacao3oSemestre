import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var response =
        await http.get(Uri.parse('http://10.109.207.164:3000/filmes'));
    if (response.statusCode == 200) {
      setState(() {
        movies =
            json.decode(response.body)['filmes']; // Acessar a chave 'filmes'
      });
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Filmes'),
      ),
      body: Center(
        child: movies.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      movies[index]['img'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(movies[index]['nome']),
                    subtitle: Text(movies[index]['descricao']),
                  );
                },
              ),
      ),
    );
  }
}
