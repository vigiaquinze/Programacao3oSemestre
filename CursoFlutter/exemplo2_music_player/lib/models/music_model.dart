class MusicModel {
  final String title;
  final String artist;
  final String url;

  MusicModel(this.title, this.artist, this.url);

  //fromMap
  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(map['title'], map['artist'], map['url']);
  }
}