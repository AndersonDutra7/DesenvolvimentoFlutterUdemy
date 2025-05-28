import 'package:flutter/material.dart';
import 'package:you_tube_clone/pages/youtube_player_page.dart';
import '../api/api.dart';
import '../models/video.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  // Instância da classe API, usada para buscar vídeos
  final API api = API();
  //  Lista de vídeos retornados pela API
  List<Video> videos = [];
  // Imagem do canal
  String? imagemCanalUrl;
  // Loading enquanto os vídeos estão sendo carregados
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVideos();
    fetchCanal();
  }

  // Função para chamar a API e buscar vídeos
  void fetchVideos() async {
    List<Video> lista = await api.searchVideos("flutterando tv");
    // Atualiza a lista de vídeos
    setState(() {
      videos = lista;
      // Desatiba o loading
      isLoading = false;
    });
  }

  // Função para pegar a foto do Canal
  void fetchCanal() async {
    final canal = await api.getCanal();
    setState(() {
      imagemCanalUrl = canal?.imagemUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Cria a lista de vídeos
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => YoutubePlayerPage(videoId: video.id),
              ),
            );
          },
          child: Column(
            children: [
              Image.network(
                video.imagem,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey,
                      child: const Center(child: Icon(Icons.error)),
                    ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      imagemCanalUrl != null
                          ? NetworkImage(imagemCanalUrl!)
                          : const AssetImage("images/logo.PNG")
                              as ImageProvider,
                ),
                title: Text(
                  video.titulo,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(video.canal),
                trailing: const Icon(Icons.more_vert, color: Colors.white),
              ),
              const Divider(color: Colors.white12),
            ],
          ),
        );
      },
    );
  }
}
