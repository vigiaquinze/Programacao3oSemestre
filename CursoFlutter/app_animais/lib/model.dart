class Animal {
  //atributos
  String _especie = '';
  String _imgUrl = '';
  String _audioUrl = '';
  //métodos
  //construtor
  Animal(String especie, String imgUrl, String audioUrl) {
    this._especie = especie;
    this._imgUrl = imgUrl;
    this._audioUrl = audioUrl;
  }
  //getters
  String get especie => _especie;
  String get imgUrl => _imgUrl;
  String get audioUrl => _audioUrl;
  //setters
  set especie(String especie){
    this._especie = especie;
  }
  set imgUrl(String imgUrl){
    this._imgUrl = imgUrl;
  }
  set audioUrl(String audioUrl){
    this._audioUrl = audioUrl;
  }
}