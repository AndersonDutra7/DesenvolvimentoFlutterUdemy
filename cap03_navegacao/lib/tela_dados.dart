import 'package:flutter/material.dart';

class TelaDados extends StatefulWidget {
  final String valor;
  const TelaDados({super.key, required this.valor});

  @override
  State<TelaDados> createState() => _TelaDadosState();
}

class _TelaDadosState extends State<TelaDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Dados"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          "Bem-vindo à tela de Dados: ${widget.valor}!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
