import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'post.dart';

class Aula08 extends StatefulWidget {
  const Aula08({super.key});

  @override
  _Aula08State createState() => _Aula08State();
}

class _Aula08State extends State<Aula08> {
  final Uri _urlBase = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  late Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    try {
      final response = await http.get(_urlBase);

      if (response.statusCode == 200) {
        var dataJson = json.decode(response.body);
        List<Post> posts =
            dataJson.map<Post>((post) {
              return Post(
                post["userId"],
                post["id"],
                post["title"],
                post["body"],
              );
            }).toList();
        return posts;
      } else {
        throw Exception('Erro ao carregar dados (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  Future<void> _post({required String title, required String body}) async {
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": title,
      "body": body,
    });

    try {
      final response = await http.post(
        _urlBase,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo,
      );

      if (response.statusCode == 201) {
        print("Postagem salva com sucesso!");
        setState(() {
          _futurePosts = _fetchPosts();
        });
      } else {
        print("Falha ao salvar: ${response.statusCode}");
      }

      print("Resposta: ${response.body}");
    } catch (e) {
      print("Erro ao fazer POST: $e");
    }
  }

  // Método PUT, usado para atualizar todos os dados de uma postagem com base no ID
  Future<void> _putPosts({
    required int id,
    required String title,
    required String body,
  }) async {
    // Criação do corpo da requisição em formato JSON
    var corpo = json.encode({
      "userId": 120, // ID do usuário fictício
      "id": id, // ID da postagem a ser atualizada
      "title": title, // Novo título
      "body": body, // Novo conteúdo
    });

    try {
      // Envio da requisição PUT para a API, com URL contendo o ID do post
      final response = await http.put(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo,
      );

      if (response.statusCode == 200) {
        print("Atualização PUT salva com sucesso!");

        setState(() {
          _futurePosts = _fetchPosts();
        });
      } else {
        print("Falha ao atualizar: ${response.statusCode}");
      }

      print("Resposta: ${response.body}");
    } catch (e) {
      print("Erro ao fazer PUT: $e");
    }
  }

  // Metodo Patch - Atualziar dados parciais na API
  Future<void> _patchPosts({required id, required String title}) async {
    var corpo = json.encode({"title": title});

    try {
      final response = await http.patch(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: corpo,
      );

      if (response.statusCode == 200) {
        print("Atualização Patch salva com sucesso!");
        setState(() {
          _futurePosts = _fetchPosts();
        });
      } else {
        print("Falha ao atualizar: ${response.statusCode}");
      }

      print("Resposta: ${response.body}");
    } catch (e) {
      print("Erro ao fazer PATCH: $e");
    }
  }

  //Metodo para excluir dados na API
  Future<void> _deletePosts({required int id}) async {
    try {
      final response = await http.delete(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      );
      if (response.statusCode == 200) {
        print("Postagem deletada com sucesso!");
        setState(() {
          _futurePosts = _fetchPosts();
        });
      } else {
        print("Falha ao deletar: ${response.statusCode}");
      }

      print("Resposta: ${response.body}");
    } catch (e) {
      print("Erro ao fazer DELETE: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aula 07 - Consumo de API")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed:
                      () => _post(
                        title: "Novo Título",
                        body: "Conteúdo da nova postagem",
                      ),
                  child: Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed:
                      () => _putPosts(
                        id: 1,
                        title: "Título PUT",
                        body: "Conteúdo da postagem PUT",
                      ),

                  child: Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: () => _patchPosts(id: 1, title: "Título PATCH"),

                  child: Text("Patch"),
                ),
                ElevatedButton(
                  onPressed: () => (_deletePosts(id: 1)),
                  child: Text("Remover"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Post>>(
                // Define a Future que está sendo observada
                future: _futurePosts,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Erro ao carregar os dados: ${snapshot.error}",
                          ),
                        );
                      } else {
                        final list = snapshot.data!;
                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final post = list[index];
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
            ),
          ],
        ),
      ),
    );
  }
}
