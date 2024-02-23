import 'package:flutter/material.dart';
import 'package:app_lista1/tarefaModel.dart';

class ListaTarefasController extends ChangeNotifier {
  List<Tarefa> _tarefas = [];
  List<Tarefa> get tarefas => _tarefas;
  int indice = 0;

  //métodos CRUD
  void adicionarTarefa(String descricao) {
    if (descricao.isNotEmpty) {
      tarefas.add(Tarefa(descricao, false));
      notifyListeners();
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }

  void desmarcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = false;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }
}
