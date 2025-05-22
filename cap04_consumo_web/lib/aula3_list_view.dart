import 'package:flutter/material.dart';

class Aula03 extends StatefulWidget {
  const Aula03({super.key});

  @override
  _Aula03State createState() => _Aula03State();
}

class _Aula03State extends State<Aula03> {
  List _itens = [];

  void _loadItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = {};
      item["titulo"] = "Título $i Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição $i ipsum dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadItens();

    return Scaffold(
      appBar: AppBar(title: Text("Lista")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          // Cria uma lista de rolagem
          itemCount: _itens.length, // Define quantos itens a lista terá
          itemBuilder: (context, indice) {
            // Função que constrói cada item da lista
            return ListTile(
              // Widget visual padrão para listas, com título e subtítulo
              title: Text(_itens[indice]["titulo"]), // Mostra o título do item
              subtitle: Text(
                _itens[indice]["descricao"],
              ), // Mostra a descrição do item
            );
          },
        ),
      ),
    );
  }
}
