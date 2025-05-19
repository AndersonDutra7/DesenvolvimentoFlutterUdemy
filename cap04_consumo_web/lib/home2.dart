import 'package:flutter/material.dart';

// Importa o pacote http para fazer requisições web.
import 'package:http/http.dart' as http;

// Importa para decodificar JSON.
import 'dart:convert';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  // Controlador do campo de texto onde o usuário digita o CEP.
  final TextEditingController _controllerCep = TextEditingController();

  // Variável que armazena o resultado da consulta e será exibida na interface.
  String _resultado = "Resultado";

  // Função que faz a consulta do CEP e atualiza a tela com os dados.
  _recuperarCep() async {
    // Captura o CEP digitado pelo usuário.
    String cepDigitado = _controllerCep.text;
    // Monta a URL da API com o CEP informado.
    String url = "https://viacep.com.br/ws/$cepDigitado/json/";
    http.Response response;

    // Realiza a requisição GET convertendo a String para Uri.
    response = await http.get(Uri.parse(url));
    // Decodifica o JSON de resposta para um Map.
    Map<String, dynamic> retorno = json.decode(response.body);
    // Extrai os dados desejados do JSON.
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    // Atualiza a interface com os dados recebidos da API.
    setState(() {
      _resultado = "$logradouro, $bairro, $localidade ";
    });

    print(
      "Resposta logradouro: $logradouro bairro: $bairro localidade: $localidade",
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
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o cep: ex: 05428200",
              ),
              style: TextStyle(fontSize: 20),
              controller: _controllerCep,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _recuperarCep,
              child: const Text("Consultar"),
            ),
            const SizedBox(height: 24),
            Text(_resultado, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
