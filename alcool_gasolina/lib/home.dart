import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcularMelhorCombustivel() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Valor inválido. Por favor, insira um número decimal válido. Use ponto (ex: 6.79)";
      });
      return;
    }

    setState(() {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        _textoResultado = "Melhor abastecer com Gasolina";
      } else {
        _textoResultado = "Melhor abastecer com Álcool";
      }
    });

    _limparCampos();
  }

  void _limparCampos() {
    setState(() {
      _controllerAlcool.clear();
      _controllerGasolina.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          // controller: controller,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("../images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para o abastecimento de seu carro",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Álcool, ex: 4.79",
                  floatingLabelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2.5,
                    ),
                  ),
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              SizedBox(height: 24),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 6.79",
                  floatingLabelStyle: TextStyle(color: Colors.blueAccent),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2.5,
                    ),
                  ),
                ),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),

              Padding(
                padding: EdgeInsets.only(top: 18),
                child: ElevatedButton(
                  onPressed: _calcularMelhorCombustivel,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16), //
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 18), //
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
