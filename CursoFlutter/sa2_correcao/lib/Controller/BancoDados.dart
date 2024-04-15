import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sa2_correcao/Model/Usuario.dart';

class DatabaseHelper {
  bool loginFoundVer = false;

  static const String DATABASE_NAME = 'userdata.db'; //nome do banco de dados
  static const String TABLE_NAME = 'userdata'; //nome da tabela
  static const String
      CREATE_USERS_TABLE_SCRIPT = //script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS userdata (id SERIAL PRIMARY KEY, username TEXT, email TEXT UNIQUE, password TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        print("Tabela criada!");
        return db.execute(CREATE_USERS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(Usuario usuario) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(TABLE_NAME, usuario.toMap());
      print("Cadastro criado!"); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<List<Usuario>> getUsers(String email, String password) async {
    try {
      Database db = await _getDatabase();
      List<Map<String, dynamic>> maps = await db.query("userdata WHERE email='${email}' AND password='${password}'");
      if (maps.isEmpty) {
        loginFoundVer = false;
        print("Não encontrado. Valor da variável: ${loginFoundVer}");
      } else {
        loginFoundVer = true;
        print("Encontrado.");
      }
      return List.generate(
        maps.length,
        (i) {
          return Usuario.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos CadastroModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  getLoginFoundVer() {
    this.loginFoundVer = loginFoundVer;
  }
}
