import 'package:flutter/material.dart';
import 'package:sa2_flutter/Cadastro.dart';
import 'package:sa2_flutter/DatabaseController.dart';
import 'package:sa2_flutter/Login.dart';
import 'package:sa2_flutter/CadastroModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Define o tema claro como padrão
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _ToggleState();
}

class _ToggleState extends State<HomePage> {
  late SharedPreferences _prefs;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool('darkMode', _darkMode);
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
    );
  }
}
