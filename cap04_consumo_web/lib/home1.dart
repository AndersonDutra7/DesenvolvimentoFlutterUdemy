import 'package:flutter/material.dart';

// Importa o pacote http para realizar requisições web (GET, POST, etc).
import 'package:http/http.dart' as http;

// Importa o pacote dart:convert para decodificar JSON.
import 'dart:convert';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  // Função responsável por realizar o consumo da API.
  _recuperarCep() async {
    String url = "https://viacep.com.br/ws/88134734/json/";

    // Declara a variável que armazenará a resposta da requisição.
    http.Response response;

    // Realiza a requisição GET para a URL convertida em objeto Uri.
    response = await http.get(Uri.parse(url));

    // Decodifica a resposta JSON para um Map de chave-valor.
    Map<String, dynamic> retorno = json.decode(response.body);

    // Acessa campos específicos do JSON recebido.
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    print(
      "Resposta logradouro: $logradouro Bairro: $bairro Cidade: $localidade",
    );

    //print("resposta: " + response.statusCode.toString() );
    //print("resposta: " + response.body );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumo de serviço web")),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            // Botão que aciona a função para consultar o CEP.
            ElevatedButton(
              onPressed: _recuperarCep,
              child: const Text("Consultar"),
            ),
          ],
        ),
      ),
    );
  }
}
