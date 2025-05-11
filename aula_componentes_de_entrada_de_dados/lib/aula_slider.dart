import 'package:flutter/material.dart';

class AulaSlider extends StatefulWidget {
  const AulaSlider({super.key});

  @override
  State<AulaSlider> createState() => _AulaSliderState();
}

class _AulaSliderState extends State<AulaSlider> {
  // Valor atual do slider
  double _valorSelecionado = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo de Slider"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Ajuste o valor desejado:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Slider com valor entre 0 e 100
            Slider(
              value: _valorSelecionado, // Valor atual
              min: 0, // Valor mínimo
              max: 100, // Valor máximo
              divisions: 20, // Divide o slider em 20 passos
              label: _valorSelecionado.round().toString(), // Label dinâmica
              activeColor: Colors.green, // Cor ativa
              onChanged: (double novoValor) {
                setState(() {
                  _valorSelecionado = novoValor;
                });
              },
            ),

            SizedBox(height: 20),

            Text(
              'Valor atual: ${_valorSelecionado.round()}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
