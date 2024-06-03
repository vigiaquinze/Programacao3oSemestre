import 'package:flutter/material.dart';
import 'package:projeto_apirest/controller/produtos_controller.dart';
import 'package:projeto_apirest/models/produto.dart';

class CadastroProdutoScreenState extends StatefulWidget {
  const CadastroProdutoScreenState({super.key});

  @override
  State<CadastroProdutoScreenState> createState() => _CadastroProdutoScreenStateState();
}

class _CadastroProdutoScreenStateState extends State<CadastroProdutoScreenState> {
  final ProdutosController _controller = ProdutosController();
  final TextEditingController _nomeProduto = TextEditingController();
  final TextEditingController _precoProduto = TextEditingController();
  final TextEditingController _idProduto = TextEditingController();

  Future<void> _cadastrarProduto() async {
    try {
      Produto produto = Produto (id: _idProduto.text, nome: _nomeProduto.text, preco: double.parse(_precoProduto.text)) await _controller.postProdutosToJson(produto);
    } catch (e) {
      
    }
  }
  
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}