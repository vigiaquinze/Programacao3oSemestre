class Produto {
  final String nome;
  final double preco;
  final String categoria;
  Produto({required this.nome, required this.preco, required this.categoria});
  factory Produto.fromJson(Map<String, dynamic> map) {
    return Produto(
      nome:map['nome'],
      preco:map['preco'],
      categoria:map['categoria']
    );
  }
}