import 'dart:io';
import 'dart:math';

import 'package:app_animais/controller.dart';
import 'package:app_animais/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaAnimaisTela extends StatelessWidget{
    final TextEditingController _controller = TextEditingController();
    final TextEditingController _controller2 = TextEditingController();
    final TextEditingController _controller3 = TextEditingController();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Animais'),
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
                labelText: 'Espécie do animal',
              ),
            ),
          ),
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Imagem do animal',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller3,
              decoration: InputDecoration(
                labelText: 'Áudio do animal',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<AnimalController>(context, listen: false)
                        .adicionarAnimal(_controller.text, _controller2.text, _controller3.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                    _controller2.clear();
                    _controller3.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<AnimalController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarAnimais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network('${_controller2.text}'),
                      // Exibição do texto da tarefa
                      title: Text(model.listarAnimais[index].especie),
                      //onTap: ,
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


class TelaAnimalDetalhe {

}