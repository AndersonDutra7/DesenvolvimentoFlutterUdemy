import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({super.key});

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "images/detalhe_contato.png",
                    width: 120,
                    height: 120,
                  ),
                  Text("Contato", style: TextStyle(fontSize: 20)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("atendimento@atmconsultoria.com.br"),
                    SizedBox(height: 16),
                    Text("Telefone: (48) 3333-9999"),
                    SizedBox(height: 16),
                    Text("Whats: (48) 99999-9999"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
