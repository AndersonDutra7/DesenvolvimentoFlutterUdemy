class Video {
  final String id;
  final String titulo;
  final String descricao;
  final String imagem;
  final String canal;

  Video({
    required this.id,
    required this.descricao,
    required this.titulo,
    required this.imagem,
    required this.canal,
  });

  //Construtor para criar um objeto a partir do Json
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"] ?? "",
      titulo: json["snippet"]["title"] ?? "",
      descricao: json["snippet"]["description"] ?? "",
      imagem: json["snippet"]["thumbnails"]["high"]["url"] ?? "",
      canal: json["snippet"]["channelTitle"] ?? "",
    );
  }
}
