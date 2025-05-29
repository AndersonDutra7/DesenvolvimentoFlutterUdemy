import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Aula05 extends StatefulWidget {
  const Aula05({super.key});

  @override
  _Aula05State createState() => _Aula05State();
}

class _Aula05State extends State<Aula05> {
  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = {};
  final TextEditingController _controllerTarefa = TextEditingController();

  // Recupera o arquivo local onde os dados serão salvos
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  // Salva os dados atualizados da lista no arquivo
  Future<void> _salvarArquivo() async {
    final arquivo = await _getFile();
    String dados = json.encode(_listaTarefas);
    await arquivo.writeAsString(dados);
  }

  // Lê os dados do arquivo local
  Future<void> _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      String dados = await arquivo.readAsString();
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    } catch (e) {
      print("Erro ao ler arquivo: $e");
    }
  }

  // Salva uma nova tarefa na lista
  void _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;
    if (textoDigitado.isEmpty) return;

    setState(() {
      _listaTarefas.add({"titulo": textoDigitado, "realizada": false});
    });

    _controllerTarefa.clear();
    _salvarArquivo();
  }

  // Cria cada item da lista com opção de remover com SnackBar
  Widget _criarItemLista(BuildContext context, int index) {
    final tarefa = _listaTarefas[index];

    return Dismissible(
      key: Key(
        DateTime.now().millisecondsSinceEpoch.toString(),
      ), // DateTime como chave única
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _ultimaTarefaRemovida = Map.from(tarefa);
        final int posicaoRemovida = index;

        setState(() {
          _listaTarefas.removeAt(index);
        });
        _salvarArquivo();

        // Mostra a snackbar com opção de desfazer
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Tarefa removida!"),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  _listaTarefas.insert(posicaoRemovida, _ultimaTarefaRemovida);
                });
                _salvarArquivo();
              },
            ),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: CheckboxListTile(
        title: Text(tarefa["titulo"]),
        value: tarefa["realizada"],
        onChanged: (valor) {
          setState(() {
            tarefa["realizada"] = valor;
          });
          _salvarArquivo();
        },
      ),
    );
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(labelText: "Digite sua tarefa"),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                      child: Text("Salvar"),
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
              itemBuilder: _criarItemLista,
            ),
          ),
        ],
      ),
    );
  }
}
