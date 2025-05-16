import 'package:cap03_navegacao/tela_route.dart';
import 'package:cap03_navegacao/tela_secundaria.dart';
import 'package:cap03_navegacao/tela_dados.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/", // Define a rota inicial da aplicação, "home" da app.
      routes: {
        // Mapeamento das rotas nomeadas para as suas telas correspondentes.
        "/":
            (context) =>
                TelaPrincipal(), // Quando a rota é "/", exibe a TelaPrincipal.
        "/telaRoute": (context) => TelaRoute(valor: "Anderson"),
        // Rota para TelaRoute. Passado o parâmetro "valor" direto na criação da tela.
        "/telaSecundaria": (context) => TelaSecundaria(),
        // Rota para TelaSecundaria, sem parâmetros.
        "/telaDados": (context) => TelaDados(valor: "Rota Dados"),
        // Rota para TelaDados, com parâmetro "valor" fixo.
      },
    ),
  );
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaSecundaria()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16), //
              ),
              child: Text("Acessar Tela Secundária"),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaDados(valor: "Anderson"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16), //
              ),
              child: Text("Acessar Tela de Dados"),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telaRoute");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16), //
              ),
              child: Text("Acessar Tela Route"),
            ),
          ],
        ),
      ),
    );
  }
}
