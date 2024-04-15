import 'package:flutter/material.dart';

class Usuario {
  int? id;
  String username;
  String email;
  String password;

  Usuario({
    required this.username,
    required this.email,
    required this.password,
  });

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}
