import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Aula05 extends StatefulWidget {
  const Aula05({super.key});

  @override
  _Aula05State createState() => _Aula05State();
}

class _Aula05State extends State<Aula05> {
  // Função assíncrona que faz a requisição HTTP e retorna um mapa com os dados
  Future<Map<String, dynamic>> _fetchPrice() async {
    final url = Uri.parse('https://blockchain.info/ticker'); // URL da API
    http.Response response = await http.get(
      url,
    ); // Aguarda a resposta da requisição GET

    // Verifica se a resposta foi bem-sucedida (código 200)
    if (response.statusCode == 200) {
      return json.decode(response.body); // Converte o JSON para Map
    } else {
      throw Exception(
        'Erro ao carregar dados',
      ); // Lança erro se a resposta falhar
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _fetchPrice(), // Chama o Future que recupera o preço
      builder: (context, snapshot) {
        String result;

        // Verifica o estado da conexão (início, carregando, concluído, etc.)
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            print("conexao waiting"); // Apenas para debug
            result = "Carregando..."; // Exibe texto enquanto espera resposta
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            print("conexao done"); // Apenas para debug

            // Verifica se houve erro na requisição
            if (snapshot.hasError) {
              result = "Erro ao carregar os dados.";
            } else {
              // Acesso ao valor retornado (ex: preço do bitcoin em reais)
              final price = snapshot.data!["BRL"]["buy"];
              result = "Preço do bitcoin: ${price.toString()} ";
            }
            break;
        }

        // Exibe o resultado centralizado na tela
        return Center(child: Text(result));
      },
    );
  }
}
