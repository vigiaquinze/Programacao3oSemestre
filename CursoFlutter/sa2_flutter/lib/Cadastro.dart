import 'package:flutter/material.dart';
import 'package:sa2_flutter/CadastroModel.dart';
import 'package:sa2_flutter/DatabaseController.dart';

class Cadastro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Usuário'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: FormularioCadastro(),
        ),
      ),
    );
  }
}

class FormularioCadastro extends StatelessWidget {
  final dbHelper = DatabaseHelper();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: 'Nome de usuário',
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'Senha',
          ),
          obscureText: true,
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            CadastroModel novoUsuario = new CadastroModel(
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text);
            await dbHelper.create(novoUsuario);
            Navigator.of(context).pop();
            // Limpar o campo de texto após adicionar a tarefa
            usernameController.clear();
            emailController.clear();
            passwordController.clear();
          },
          child: Text('Cadastrar'),
        ),
      ],
    );
  }
}
