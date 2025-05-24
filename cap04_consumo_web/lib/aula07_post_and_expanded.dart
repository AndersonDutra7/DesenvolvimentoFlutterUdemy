import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'post.dart';

class Aula07 extends StatefulWidget {
  const Aula07({super.key});

  @override
  _Aula07State createState() => _Aula07State();
}

class _Aula07State extends State<Aula07> {
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

  //Metodo para gravar dados na API
  Future<void> _post({required String title, required String body}) async {
    // Cria o corpo da requisição POST no formato JSON
    var corpo = json.encode({
      "userId": 120,
      "id": null,
      "title": title,
      "body": body,
    });

    try {
      // Realiza a requisição POST para a URL base
      final response = await http.post(
        _urlBase,
        // Define o tipo de conteúdo da requisição
        headers: {"Content-type": "application/json; charset=UTF-8"},
        // Corpo JSON enviado na requisição
        body: corpo,
      );

      // Verifica se a resposta foi um sucesso (201 Created)
      if (response.statusCode == 201) {
        print("Postagem salva com sucesso!");
        // Atualiza a lista de postagens para refletir a nova inserção
        setState(() {
          _futurePosts = _fetchPosts(); // atualiza a lista
        });
      } else {
        print("Falha ao salvar: ${response.statusCode}");
      }

      print("Resposta: ${response.body}");
    } catch (e) {
      print("Erro ao fazer POST: $e");
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
                  onPressed: () {
                    setState(() {
                      _futurePosts = _fetchPosts();
                    });
                  },
                  child: Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Remoção ainda não implementada')),
                    );
                  },
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
