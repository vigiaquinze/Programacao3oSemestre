import 'package:app_animais/model.dart';
import 'package:flutter/material.dart';

class AnimalController extends ChangeNotifier{
  //atributo
  List<Animal> _listAnimais = [];
  //get da lista
  List get listarAnimais => _listAnimais;
  void adicionarAnimal(especie, imgUrl, audioUrl) {
    Animal novoAnimal = new Animal(especie, imgUrl, audioUrl);
    _listAnimais.add(novoAnimal);
    notifyListeners();
  }
}