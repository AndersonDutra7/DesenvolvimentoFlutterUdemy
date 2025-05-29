import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Aula03 extends StatefulWidget {
  const Aula03({super.key});

  @override
  _Aula03State createState() => _Aula03State();
}

class _Aula03State extends State<Aula03> {
  List _listaTarefas = [];
  final TextEditingController _controllerTarefa = TextEditingController();

  // Retorna o diretório onde o arquivo será salvo
  Future<File> _getArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  // Salva a lista de tarefas no arquivo
  Future<void> _salvarArquivo() async {
    var arquivo = await _getArquivo();
    String dados = json.encode(_listaTarefas);
    await arquivo.writeAsString(dados);
  }

  // Lê os dados do arquivo salvo
  Future<void> _lerArquivo() async {
    try {
      final arquivo = await _getArquivo();
      String dados = await arquivo.readAsString();

      setState(() {
        _listaTarefas = json.decode(dados);
      });
    } catch (e) {
      // Se o arquivo ainda não existir, ignora o erro
      print("Erro ao ler arquivo: $e");
    }
  }

  // Adiciona uma nova tarefa
  void _adicionarTarefa(String titulo) {
    Map<String, dynamic> novaTarefa = {"titulo": titulo, "realizada": false};

    setState(() {
      _listaTarefas.add(novaTarefa);
    });

    _salvarArquivo();
  }

  // Inicializa os dados ao abrir o app
  @override
  void initState() {
    super.initState();
    _lerArquivo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),

      // Botão flutuante para adicionar tarefa
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          _controllerTarefa.clear(); // Limpa o campo de texto
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(labelText: "Digite sua tarefa"),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      String texto = _controllerTarefa.text;
                      if (texto.isNotEmpty) {
                        _adicionarTarefa(texto);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),

      // Lista de tarefas
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: (context, index) {
                final tarefa = _listaTarefas[index];
                return ListTile(
                  title: Text(tarefa["titulo"]),
                  trailing: Icon(
                    tarefa["realizada"]
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: tarefa["realizada"] ? Colors.green : null,
                  ),
                  onTap: () {
                    setState(() {
                      tarefa["realizada"] = !tarefa["realizada"];
                    });
                    _salvarArquivo();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
