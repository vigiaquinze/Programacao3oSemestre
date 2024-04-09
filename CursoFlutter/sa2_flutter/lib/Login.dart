import 'package:flutter/material.dart';
import 'package:sa2_flutter/Cadastro.dart';
import 'package:sa2_flutter/CadastroModel.dart';
import 'package:sa2_flutter/DatabaseController.dart';
import 'package:sa2_flutter/HomePage.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  bool loginFound = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String resultado = "";

  _login() async {
    await () {
      if (passwordController.text != null && emailController.text != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        setState(() {
          resultado = "Falha no login";
        });
      }
    };
  }

  _cadastro() {
    Navigator.pushNamed(context, "/cadastro");
  }

  @override
  Widget build(BuildContext context) {
    bool loginFoundVer = false;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Login'),
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
                            print("Passou pelo IF");
                            await dbHelper.getUsers(
                                emailController.text, passwordController.text);
                            //Limpando os campos de texto
                            emailController.clear();
                            passwordController.clear();
                            if (dbHelper.getLoginFoundVer() == false) {
                              print('bloqueado');
                            } else if (dbHelper.getLoginFoundVer() == true) {
                              print(
                                  "Passou pelo if de novo. Valor da variavel ${loginFoundVer}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          }
                        },
                        child: Text('Entrar na Conta'),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cadastro()),
                          );
                        },
                        child: Text('Criar uma Conta'),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
