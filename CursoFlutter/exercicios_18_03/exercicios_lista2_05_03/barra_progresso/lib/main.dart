import 'package:flutter/material.dart';

// Função principal que inicializa a aplicação Flutter
void main() {
// Inicia a execução da aplicação com o widget MyApp
  runApp(BarraDeProgresso());
}

//Criando a classe MyApp, herdando de StatelessWidget apenas para rodar a aplicação
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BarraDeProgresso(),
    );
  }
}

// Definindo a classe MyApp que herda de StatefulWidget
class BarraDeProgresso extends StatefulWidget {
  const BarraDeProgresso({super.key});
// Método build, obrigatório em StatelessWidget, retorna a árvore de widgets da aplicação
  @override
  State<BarraDeProgresso> createState() => _BarraDeProgressoState();
}

class _BarraDeProgressoState extends State<BarraDeProgresso>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  //método para iniciar o State
  void initState() {
    //criando o controller da animação
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  //método para a barra voltar a zero
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// Configura a tela inicial como um Scaffold
        home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Barra de Progresso Dinâmica',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              //Valor da barra de progresso que é atualizada pelo Controller
              value: controller.value,
              //Border radius para a barra de progresso ter as bordas arredondadas
              borderRadius: BorderRadius.circular(20.0),
              //Mudando a cor da barra de progresso
              color: Color.fromRGBO(255, 0, 85, 1),
              //Mudando a cor de fundo da barra
              backgroundColor: Color.fromRGBO(158, 158, 158, 1),
            ),
          ],
        ),
      ),
    ));
  }
}
