import 'package:flutter/material.dart';
import '../api/api.dart';
import '../models/video.dart';

// Classe CustomSearchDelegate Estende SearchDelegate<Video?>, ou seja, será usada para buscar um objeto do tipo Video.
class CustomSearchDelegate extends SearchDelegate<Video?> {
  // Instancia a API para fazer buscas reais.

  final API api = API();

  List<Video> videos = [];
  bool isLoading = false;

  @override
  // Define o estilo do texto digitado pelo usuário (cor branca).
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.white);

  // Exibe um botão de limpar (X) no campo de busca.
  // Quando pressionado, limpa o texto (query = "") e atualiza as sugestões.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context); // Atualiza sugestões
        },
      ),
    ];
  }

  // Botão de voltar (seta para a esquerda).
  // Fecha a busca e retorna null como resultado.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Fecha a busca
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Quando o usuário confirma a busca, mostra a lista de vídeos
    return FutureBuilder<List<Video>>(
      // Executa api.searchVideos(query) para buscar os vídeos.
      future: api.searchVideos(query),
      builder: (context, snapshot) {
        // waiting: Mostra um spinner enquanto carrega.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // !hasData || isEmpty: Mostra uma mensagem se não encontrou nada.
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("Nenhum vídeo encontrado para \"$query\""));
        }
        final results = snapshot.data!;
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final video = results[index];
            return ListTile(
              leading: Image.network(
                video.imagem,
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(video.titulo),
              subtitle: Text(video.canal),
              onTap: () {
                close(context, video); // Retorna o vídeo selecionado, se quiser
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Se query estiver vazia, exibe uma mensagem inicial.
    if (query.isEmpty) {
      return Center(child: Text("Digite para buscar vídeos"));
    }
    // Exibe sugestões em tempo real.
    return FutureBuilder<List<Video>>(
      future: api.searchVideos(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("Nenhum vídeo encontrado para \"$query\""));
        }
        final suggestions = snapshot.data!;
        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final video = suggestions[index];
            return ListTile(
              leading: Image.network(
                video.imagem,
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(video.titulo),
              subtitle: Text(video.canal),
              // Ao tocar em uma sugestão, atualiza a query e chama showResults(context).
              onTap: () {
                query = video.titulo;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
