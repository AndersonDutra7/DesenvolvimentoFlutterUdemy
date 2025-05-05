import 'dart:math';

import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Faça sua escolha abaixo:";
  bool _partidaEncerrada = false;
  String _escolhaUsuario = "";

  void _opcaoSelecionada(String escolhaUsuario) {
    if (_partidaEncerrada) return;

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      _escolhaUsuario = escolhaUsuario;

      // Imagem do App
      _imagemApp = AssetImage("imagens/$escolhaApp.png");

      // Validação do Ganhador
      if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
        _mensagem = "Parabéns! Você ganhou =)";
      } else if ((escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "pedra")) {
        _mensagem = "Que pena! Você perdeu =(";
      } else {
        _mensagem = "Ohh, Empatamos =]";
      }

      _partidaEncerrada = true;
    });
  }

  void _resetPartida() {
    setState(() {
      _imagemApp = AssetImage("imagens/padrao.png");
      _mensagem = "Faça sua escolha abaixo";
      _partidaEncerrada = false;
      _escolhaUsuario = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Escolha do App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Image(image: _imagemApp),
            Text(
              _mensagem,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                for (var opcao in ["pedra", "papel", "tesoura"])
                  GestureDetector(
                    onTap:
                        !_partidaEncerrada
                            ? () => _opcaoSelecionada(opcao)
                            : null,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.all(4),
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     color:
                      //         _escolhaUsuario == opcao
                      //             ? Colors.blue
                      //             : Colors.transparent,
                      //     width: 30,
                      //   ),
                      //   borderRadius: BorderRadius.circular(80),
                      // ),
                      child: Image.asset(
                        "imagens/$opcao.png",
                        height:
                            _partidaEncerrada
                                ? (_escolhaUsuario == opcao ? 120 : 50)
                                : 80,
                      ),
                    ),
                  ),
              ],
            ),
            if (_partidaEncerrada)
              ElevatedButton(
                onPressed: _resetPartida,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 22),
                ),
                child: Text("Nova Partida"),
              ),
          ],
        ),
      ),
    );
  }
}
