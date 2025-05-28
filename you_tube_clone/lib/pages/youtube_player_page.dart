import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String videoId;

  const YoutubePlayerPage({super.key, required this.videoId});

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera recursos ao sair da tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: const Text("Assistindo vídeo")),
          body: Column(
            children: [
              player,
              const SizedBox(height: 20),
              const Text("Toque no vídeo para pausar/reproduzir"),
            ],
          ),
        );
      },
    );
  }
}
