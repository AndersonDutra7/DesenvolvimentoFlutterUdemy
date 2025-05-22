import 'package:cap04_consumo_web/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Aula06 extends StatefulWidget {
  const Aula06({super.key});

  @override
  _Aula06State createState() => _Aula06State();
}

class _Aula06State extends State<Aula06> {
  // URL base da API
  final Uri _urlBase = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  // Função que busca os posts da API
  Future<List<Post>> _fetchPosts() async {
    http.Response response = await http.get(_urlBase);

    if (response.statusCode == 200) {
      var dataJson = json.decode(response.body);

      List<Post> posts = [];
      for (var post in dataJson) {
        print("post: ${post["title"]}");
        Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
        posts.add(p);
      }

      return posts;
    } else {
      throw Exception('Erro ao carregar dados');
    }
  }

  // Método build que exibe o layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 06- Consumo de serviço API Carregando Dados"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _fetchPosts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text("Erro ao carregar os dados."));
              } else {
                // Dados carregados com sucesso
                List<Post> list = snapshot.data!;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Post post = list[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text("ID: ${post.id}"),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
