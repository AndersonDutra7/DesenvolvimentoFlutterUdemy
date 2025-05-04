import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _frases = [
    "Cada linha de código é um passo mais perto da sua nova carreira.",
    "Você não está apenas aprendendo Flutter, está construindo seu futuro.",
    "Persistência hoje é liberdade profissional amanhã.",
    "O esforço agora será o seu orgulho no próximo app lançado.",
    "Todo especialista já foi iniciante — continue!",
    "Seu portfólio em construção será a chave que abrirá novas portas.",
    "Estudar Flutter não é só aprender uma tecnologia, é acreditar no seu potencial de mudança.",
  ];

  String _fraseGerada = "Clique aqui para gerar uma frase";

  void gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do Dia'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          // decoration: BoxDecoration(
          //   border: Border.all(width: 3, color: Colors.amber),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("../lib/assets/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  gerarFrase();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor de fundo
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
