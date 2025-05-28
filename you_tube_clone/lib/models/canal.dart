class Canal {
  final String id;
  final String nome;
  final String imagemUrl;
  final String inscritos;
  final String totalVideos;
  final String visualizacoes;

  Canal({
    required this.id,
    required this.nome,
    required this.imagemUrl,
    required this.inscritos,
    required this.totalVideos,
    required this.visualizacoes,
  });

  factory Canal.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];
    final statistics = json['statistics'];
    final thumbnails = snippet['thumbnails'];

    return Canal(
      id: json['id'],
      nome: snippet['title'],
      imagemUrl: thumbnails['default']['url'],
      inscritos: statistics['subscriberCount'],
      totalVideos: statistics['videoCount'],
      visualizacoes: statistics['viewCount'],
    );
  }
}
