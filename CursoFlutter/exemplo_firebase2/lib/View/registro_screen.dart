import 'package:exemplo_firebase2/Service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthService _authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // tela de registro com confirmação de senha
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                  //campos do form
                  children: <Widget>[
                    TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                        validator: (value) {}),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                      validator: (value) {},
                    ),
                    TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar Senha',
                        ),
                        validator: (value) {}),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: () {}, child: Text('Registrar'),)
                  ])),
        ),
      ),
    );
  }

  Future<User?> _registrar() async {
    if (_confirmPasswordController == _passwordController) {
      if (_formKey.currentState!.validate()) {
        return _authService.registerWithEmail(
            _emailController.text, _confirmPasswordController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Preencha todos os campos'),
          ),
        );
        return null;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Senhas não conferem'),
        ),
      );
      return null;
    }
  }
}
