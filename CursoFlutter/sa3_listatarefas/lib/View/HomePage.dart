import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../Model/Tarefa.dart';

class PaginaHome extends StatefulWidget {
  String email;
  PaginaHome({required this.email});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro
  String email;
  String? _idioma;
  String? _descricao;
  bool _concluida = false;

  final TextEditingController _controller = TextEditingController();

  List<Tarefa> _tarefas = [];
  List<Tarefa> get tarefas => _tarefas;
  int indice = 0;

  _PaginaHomeState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor
      _idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
    });
  }

  Future<void> _mudarDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('${email}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _mudarIdioma(String novoIdioma) async {
    setState(() {
      _idioma = novoIdioma;
    });
    await _prefs.setString('${email}_idioma', _idioma!);
  }

  //métodos CRUD
  Future<void> _adicionarTarefa(String descricao) async {
    if (descricao.isNotEmpty) {
      setState(() {
        tarefas.add(Tarefa(descricao: descricao, concluida: false, id: null));
      });
      await _prefs.setString('${email}_[${indice}]_descricao', _descricao!);
    }
  }

  Future<void> _marcarComoConcluida(int indice) async {
    if (indice >= 0 && indice < _tarefas.length) {
      setState(() {
        _tarefas[indice].concluida = true;
      });
      await _prefs.setBool('${email}_[${indice}]_concluida', _concluida!);
    }
  }

  Future<void> _desmarcarComoConcluida(int indice) async {
    if (indice >= 0 && indice < _tarefas.length) {
      setState(() {
        _tarefas[indice].concluida = false;
      });
      await _prefs.setBool('${email}_[${indice}]_concluida', _concluida!);
    }
  }

  Future<void> _excluirTarefa(int indice) async {
    if (indice >= 0 && indice < _tarefas.length) {
      setState(() {
        _tarefas.removeAt(indice);
      });
      await _prefs.remove('${email}_[${indice}]');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Tarefa',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<_PaginaHomeState>(context, listen: false)
                        ._adicionarTarefa(_controller.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<_PaginaHomeState>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.tarefas[index].descricao.trim()),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida,
                        onChanged: (value) {
                          // Usando if else para saber se a tarefa está concluída ou não
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          if (model.tarefas[index].concluida == false) {
                            model._marcarComoConcluida(index);
                            // Chamando o método desmarcarComoConcluida para atualizar o estado
                          } else {
                            model._desmarcarComoConcluida(index);
                          }
                          ;
                        },
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model._excluirTarefa(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
