import 'package:flutter/material.dart';

class Aula04 extends StatefulWidget {
  const Aula04({super.key});

  @override
  _Aula04State createState() => _Aula04State();
}

class _Aula04State extends State<Aula04> {
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
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            return ListTile(
              // 👇 Evento de clique simples: chamado ao tocar no item
              onTap: () {
                // 👇 Exibe um diálogo (caixa de alerta) ao clicar em um item
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // 👇 Define o título da caixa de alerta com o título do item
                      title: Text(_itens[indice]["titulo"]),
                      // 👇 Espaçamento interno do título
                      titlePadding: EdgeInsets.all(20),
                      // 👇 Estilo do texto do título
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                      // 👇 Corpo do alerta: exibe a descrição do item
                      content: Text(_itens[indice]["descricao"]),
                      // 👇 Ações (botões) do alerta
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // 👇 Ação ao clicar em "Sim"
                            print("Selecionado sim");
                            Navigator.pop(context); // fecha o alerta
                          },
                          child: Text("Sim"),
                        ),
                        TextButton(
                          onPressed: () {
                            // 👇 Ação ao clicar em "Não"
                            print("Selecionado nao");
                            Navigator.pop(context); // fecha o alerta
                          },
                          child: Text("Não"),
                        ),
                      ],
                      // backgroundColor: Colors.orange, // cor de fundo (opcional)
                    );
                  },
                );
              },
              /*onLongPress: (){
                  print("clique com onLongPress");
                },*/
              title: Text(_itens[indice]["titulo"]),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}
