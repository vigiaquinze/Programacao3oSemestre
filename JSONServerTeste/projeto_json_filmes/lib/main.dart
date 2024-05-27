import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Movie {
  final String id;
  final String img;
  final String nome;
  final String descricao;

  Movie({
    required this.id,
    required this.img,
    required this.nome,
    required this.descricao,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      img: json['img'] ?? '',
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
    );
  }
}

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
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse('https://10.109.207.164:3000/filmes'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        movies = jsonData.map((data) => Movie.fromJson(data)).toList();
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
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                movies[index].img,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(movies[index].nome),
              subtitle: Text(movies[index].descricao),
            );
          },
        ),
      ),
    );
  }
}
