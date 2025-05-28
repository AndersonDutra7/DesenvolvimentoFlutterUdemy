import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Aula01 extends StatefulWidget {
  const Aula01({super.key});

  @override
  State<Aula01> createState() => _Aula01State();
}

class _Aula01State extends State<Aula01> {
  String _textoSalvo = "Digite algo para Salvar";
  final TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("palavra", valorDigitado);

    print("Função salvar: $valorDigitado");

    setState(() {
      _textoSalvo = "Salvo: $valorDigitado";
    });
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    String? valor = prefs.getString("palavra");

    print("Função recuperar: $valor");

    setState(() {
      _textoSalvo = valor ?? "Nenhum valor encontrado.";
    });
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("palavra");
    setState(() {
      _textoSalvo = "Valor removido.";
    });

    print("Função remover executada.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 01 - Manipulação de Dados"),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(_textoSalvo),
            TextField(
              controller: _controllerCampo,
              decoration: InputDecoration(
                labelText: "Digite algo",
                floatingLabelStyle: TextStyle(color: Colors.amber),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed: _recuperar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("Ler"),
                ),
                ElevatedButton(
                  onPressed: _remover,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("Remover"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
