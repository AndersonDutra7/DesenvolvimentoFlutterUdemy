import 'package:flutter/material.dart';

class Aula03RadioButton extends StatefulWidget {
  const Aula03RadioButton({super.key});

  @override
  State<Aula03RadioButton> createState() => _Aula03RadioButtonState();
}

class _Aula03RadioButtonState extends State<Aula03RadioButton> {
  // Variável para armazenar o valor selecionado pelo usuário
  int _opcaoSelecionada = 1;

  // Função que altera a seleção do rádio button
  void _alterarSelecao(int? valor) {
    setState(() {
      _opcaoSelecionada = valor!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo de RadioButton"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Selecione uma opção:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Primeiro RadioButton com a opção 1
            RadioListTile<int>(
              title: Text('Opção 1: Comida Brasileira'),
              value: 1, // Valor associado a essa opção
              groupValue: _opcaoSelecionada, // Valor atual selecionado
              onChanged: _alterarSelecao, // Função para alterar a seleção
              activeColor: Colors.green, // Cor do botão quando ativo
              subtitle: Text('A melhor comida do mundo!'),
            ),

            // Segundo RadioButton com a opção 2
            RadioListTile<int>(
              title: Text('Opção 2: Comida Mexicana'),
              value: 2,
              groupValue: _opcaoSelecionada,
              onChanged: _alterarSelecao,
              activeColor: Colors.blue,
              subtitle: Text('Comida boa, mas não a melhor!'),
            ),

            SizedBox(height: 20),
            Text(
              'Opção Selecionada: ${_opcaoSelecionada == 1 ? 'Comida Brasileira' : 'Comida Mexicana'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
