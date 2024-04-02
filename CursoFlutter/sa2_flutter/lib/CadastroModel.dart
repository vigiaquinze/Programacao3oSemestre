import 'package:flutter/material.dart';

class CadastroModel {
  int? id;
  String username;
  String email;
  String password;

  CadastroModel({
    required this.username,
    required this.email,
    required this.password,
  });

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory CadastroModel.fromMap(Map<String, dynamic> map) {
    return CadastroModel(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}
