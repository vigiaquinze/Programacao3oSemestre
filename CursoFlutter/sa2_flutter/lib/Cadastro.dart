import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sa2_flutter/CadastroModel.dart';
import 'package:sa2_flutter/DatabaseController.dart';
import 'package:sa2_flutter/Login.dart';

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
        TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: 'Nome de usuário',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return ('O seu nome de usuário não pode estar vazio.');
            }
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return ('O seu e-mail não pode estar vazio.');
            }
          },
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'Senha',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return ('A sua senha não pode estar vazia.');
            } else if (value.length < 5) {
              return ('');
            }
            ;
          },
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
            //Limpando os campos de texto
            usernameController.clear();
            emailController.clear();
            passwordController.clear();
            //Navigator push para enviar para outra página da aplicação
            _contaCriada(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Text('Cadastrar'),
        ),
      ],
    );
  }

  void _contaCriada(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Pronto!"),
            content: Text("Conta criada."),
            actions: [okButton],
          );
        });
  }

  Widget okButton = TextButton(
    child: Text(""),
    onPressed: () {
      Navigator.of(context as BuildContext).pop();
    },
  );
}
