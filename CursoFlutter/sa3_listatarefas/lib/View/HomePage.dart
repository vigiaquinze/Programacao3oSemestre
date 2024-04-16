import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../Model/Tarefa.dart';

class PaginaHome extends StatefulWidget {
  String nome;
  PaginaHome({required this.nome});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(nome: nome);
}

class _PaginaHomeState extends State<PaginaHome> {
  String nome;

  final TextEditingController _controller = TextEditingController();

  List<String> tasks = []; // Lista de tarefas

  _PaginaHomeState({required this.nome});

  @override
  void initState() {
    super.initState();
    loadTasks(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      tasks = prefs.getStringList('${nome}_tasks') ??
          []; // Carrega as tarefas armazenadas ou uma lista vazia se não houver tarefas
    });
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    await prefs.setStringList('${nome}_tasks',
        tasks); // Salva a lista de tarefas nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'), // Título da barra de aplicativos
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Número de itens na lista de tarefas
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]), // Título do item da lista
            onLongPress: () {
              setState(() {
                tasks.removeAt(index); // Remove a tarefa da lista
                saveTasks(); // Salva as tarefas atualizadas
              });
            },
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                        'Editar Tarefa'), // Título do diálogo de nova tarefa
                    content: TextField(
                      controller:
                          _controller, // Controlador de texto para o campo de entrada
                      decoration: InputDecoration(
                          hintText: '${index}'), // Dica no campo de entrada
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(
                                index); // Adiciona a nova tarefa à lista
                            tasks.add(_controller
                                .text); // Adiciona a nova tarefa à lista
                            saveTasks(); // Salva as tarefas atualizadas
                            _controller.clear(); // Limpa o campo de entrada
                            Navigator.of(context).pop(); // Fecha o diálogo
                          });
                        },
                        child: Text('Editar'), // Botão para adicionar a tarefa
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Nova Tarefa'), // Título do diálogo de nova tarefa
                content: TextField(
                  controller:
                      _controller, // Controlador de texto para o campo de entrada
                  decoration: InputDecoration(
                      hintText: 'Digite a tarefa'), // Dica no campo de entrada
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(
                            _controller.text); // Adiciona a nova tarefa à lista
                        saveTasks(); // Salva as tarefas atualizadas
                        _controller.clear(); // Limpa o campo de entrada
                        Navigator.of(context).pop(); // Fecha o diálogo
                      });
                    },
                    child: Text('Adicionar'), // Botão para adicionar a tarefa
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add), // Ícone do botão de adicionar
      ),
    );
  }
}
