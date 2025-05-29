import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Aula04 extends StatefulWidget {
  const Aula04({super.key});

  @override
  State<Aula04> createState() => _Aula04State();
}

class _Aula04State extends State<Aula04> {
  List _listaTarefas = [];
  final TextEditingController _controllerTarefa = TextEditingController();

  /// Retorna o arquivo 'dados.json' no diretório do app
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  /// Salva tarefa no arquivo após adicionar à lista
  void _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> novaTarefa = {
      "titulo": textoDigitado,
      "realizada": false,
    };

    setState(() {
      _listaTarefas.add(novaTarefa);
    });

    _salvarArquivo();
    _controllerTarefa.clear();
  }

  /// Salva a lista atual no arquivo JSON
  Future<void> _salvarArquivo() async {
    final arquivo = await _getFile();
    String dados = json.encode(_listaTarefas);
    await arquivo.writeAsString(dados);
  }

  /// Lê o arquivo e retorna os dados como String
  Future<String?> _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return await arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  /// Carrega os dados do arquivo ao iniciar o app
  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados) {
      if (dados != null) {
        setState(() {
          _listaTarefas = json.decode(dados);
        });
      }
    });
  }

  /// Cria cada item da lista com Dismissible e Checkbox
  Widget criarItemLista(BuildContext context, int index) {
    final tarefa = _listaTarefas[index];

    return Dismissible(
      key: Key(tarefa["titulo"] + index.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _listaTarefas.removeAt(index);
        });
        _salvarArquivo();
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: CheckboxListTile(
        title: Text(tarefa["titulo"]),
        value: tarefa["realizada"],
        onChanged: (valorAlterado) {
          setState(() {
            tarefa["realizada"] = valorAlterado;
          });
          _salvarArquivo();
        },
      ),
    );
  }

  /// Interface principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (_) => AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: const InputDecoration(
                      labelText: "Digite sua tarefa",
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Cancelar"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("Salvar"),
                      onPressed: () {
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: criarItemLista,
            ),
          ),
        ],
      ),
    );
  }
}
