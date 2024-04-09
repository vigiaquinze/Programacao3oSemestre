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
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String resultado = "";

  _cadastro() {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      setState(() {
        resultado = "Por favor, preencha todos os dados.";
      });
    } else {
      if (!_formKey.currentState!.validate()) {
        setState(() {
          resultado = "Por favor, verifique todos os campos";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Cadastro de Usuário'),
            ),
            body: SingleChildScrollView(
              reverse: true,
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
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
                              validator: (emailController) {
                                if (emailController!.isEmpty) {
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
                                  return ('Sua senha deve conter pelo menos 5 caracteres');
                                }
                                ;
                              },
                              obscureText: true,
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  CadastroModel novoUsuario = new CadastroModel(
                                      username: usernameController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                  await dbHelper.create(novoUsuario);
                                  _contaCriada(context);
                                  //Limpando os campos de texto
                                  usernameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  //Navigator push para enviar para outra página da aplicação
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                }
                                ;
                              },
                              child: Text('Cadastrar'),
                            ),
                          ]))),
            )));
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
