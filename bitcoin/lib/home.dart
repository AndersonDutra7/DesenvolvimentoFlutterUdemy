import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // Importa o pacote http para fazer requisições web
import 'dart:convert'; // Importa o pacote para converter o JSON da resposta em um Map

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _bitcoinValue = 0.0;

  Future<void> _updateBitcoinValue() async {
    final url = Uri.parse(
      'https://blockchain.info/ticker',
    ); // Define a URL da API que retorna os preços do Bitcoin
    final response = await http.get(
      url,
    ); // Faz uma requisição GET para a URL e espera a resposta

    if (response.statusCode == 200) {
      // Verifica se a resposta foi bem-sucedida (código 200)
      final data = jsonDecode(
        response.body,
      ); // Converte o corpo da resposta (JSON) em um Map
      final double newValue =
          data['BRL']['buy']; // Acessa o valor de compra do Bitcoin em reais (BRL)

      setState(() {
        _bitcoinValue =
            newValue; // Atualiza o valor exibido no app com o novo valor recebido da API
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao carregar valor do Bitcoin")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800),
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/bitcoin.png"),
                SizedBox(height: 32),
                Text(
                  "R\$ ${_bitcoinValue.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _updateBitcoinValue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "Atualizar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
