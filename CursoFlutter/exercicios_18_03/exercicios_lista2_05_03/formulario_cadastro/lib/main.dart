// Importa o pacote de material Flutter
import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(MyApp());
}

// Definindo a classe MyApp que herda de StatelessWidget
class MyApp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  Widget build(BuildContext context) {
    // Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);
// Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;
// Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;
// Retorna um MaterialApp, que é o widget raiz da aplicação Flutter
    return MaterialApp(
// Configura a tela inicial como um Scaffold
        home: Scaffold(
// Barra superior da tela (AppBar)
            appBar: AppBar(
// Título da barra superior
              title: Text('Formulário de Cadastro'),
            ),
// Corpo da tela, composto por um Column (coluna vertical) de widgets
            body: Column(children: [
              // Campos de texto para adicionar o nome e o valor do item.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Adicionar nome...',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller2,
                  decoration: InputDecoration(
                    labelText: 'Adicionar e-mail...',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller3,
                  decoration: InputDecoration(
                    labelText: 'Adicionar senha...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        // Limpar o campo de texto após adicionar a tarefa
                        _controller.clear();
                        _controller2.clear();
                        _controller3.clear();
                        showDialog(
                          // Notifica o usuario
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Concluído'),
                            content: Text('Cadastro realizado!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Fecha o AlertDialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
