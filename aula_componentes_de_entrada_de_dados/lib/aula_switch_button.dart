import 'package:flutter/material.dart';

class AulaSwitchButton extends StatefulWidget {
  const AulaSwitchButton({super.key});

  @override
  State<AulaSwitchButton> createState() => _AulaSwitchButtonState();
}

class _AulaSwitchButtonState extends State<AulaSwitchButton> {
  // Variáveis booleanas para armazenar os estados dos switches
  bool _comidaBrasileiraSelecionada = false;
  bool _comidaMexicanaSelecionada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo de SwitchListTile"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Ative suas preferências:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Primeiro SwitchListTile para comida brasileira
            SwitchListTile(
              title: Text('Comida Brasileira'),
              subtitle: Text('A melhor comida do mundo!'),
              value: _comidaBrasileiraSelecionada, // Estado atual do switch
              onChanged: (bool valor) {
                setState(() {
                  _comidaBrasileiraSelecionada = valor; // Atualiza o estado
                });
              },
              activeColor: Colors.green, // Cor quando ativado
            ),

            // Segundo SwitchListTile para comida mexicana
            SwitchListTile(
              title: Text('Comida Mexicana'),
              subtitle: Text('Comida boa, mas não a melhor!'),
              value: _comidaMexicanaSelecionada,
              onChanged: (bool valor) {
                setState(() {
                  _comidaMexicanaSelecionada = valor;
                });
              },
              activeColor: Colors.blue,
            ),

            SizedBox(height: 20),

            // Texto que exibe as escolhas do usuário
            Text(
              'Preferências selecionadas:\n'
              '${_comidaBrasileiraSelecionada ? '✅ Comida Brasileira\n' : ''}'
              '${_comidaMexicanaSelecionada ? '✅ Comida Mexicana' : ''}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
