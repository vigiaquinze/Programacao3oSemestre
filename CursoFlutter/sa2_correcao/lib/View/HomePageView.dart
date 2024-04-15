// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:sa2_correcao/View/LoginPageView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  PaginaHome({required this.email});
  String email;

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences _prefs;
  bool _darkMode = false;
  String idioma = '';
  String email;
  _PaginaHomeState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ?? false;
      idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool('darkMode', _darkMode);
  }

  Future<void> _toggleLanguage() async {
    setState(() {
      idioma = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            );
          }),
          title: Text('Configurações do Usuário'),
        ),
        body: Center(
          child: Switch(
            value: _darkMode,
            onChanged: (value) {
              _toggleDarkMode();
            },
          ),
        ),
      ),
    );;
  }
}