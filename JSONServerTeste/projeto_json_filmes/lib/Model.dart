class Movie {
  final String id;
  final String img;
  final String nome;
  final String descricao;

  Movie({
    required this.id,
    required this.img,
    required this.nome,
    required this.descricao,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      img: json['img'] ?? '',
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
    );
  }
}

void main() {
  List<Movie> movies = [
    Movie(
      id: "1",
      img: "https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg",
      nome: "Ilha do Medo",
      descricao: "Nos anos 1950, a fuga de uma assassina leva o detetive Teddy Daniels e seu parceiro a investigarem o seu desaparecimento de um quarto trancado em um hospital psiquiátrico. Lá, uma rebelião se inicia e o agente terá que enfrentar seus próprios medos.",
    ),
    Movie(
      id: "2",
      img: "https://images.savoysystems.co.uk/PCH/26431724.jpg",
      nome: "Mulholland Drive",
      descricao: "Uma jovem atriz viaja para Hollywood e se vê emaranhada numa intriga secreta com uma mulher que escapou por pouco de ser assassinada, e que agora se encontra com amnésia devido a um acidente de carro. Seu mundo se torna um pesadelo e surreal.",
    ),
    Movie(
      id: "3",
      img: "https://m.media-amazon.com/images/M/MV5BN2Y2OWU4MWMtNmIyMy00YzMyLWI0Y2ItMTcyZDc3MTdmZDU4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg",
      nome: "Os 12 Macacos",
      descricao: "Um condenado do ano de 2035 é enviado de volta no tempo para descobrir a causa de um vírus que acabou com quase toda a população do planeta. Os poucos sobreviventes moram em abrigos subterrâneos.",
    ),
    Movie(
      id: "c2ac",
      img: "",
      nome: "",
      descricao: "",
    ),
  ];

  // Exemplo de como acessar os dados
  for (Movie movie in movies) {
    print('ID: ${movie.id}');
    print('Nome: ${movie.nome}');
    print('Descrição: ${movie.descricao}');
    print('Imagem: ${movie.img}');
    print('-------------------------');
  }
}
