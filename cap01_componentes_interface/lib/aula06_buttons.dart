import 'package:flutter/material.dart';

class Aula06Buttons extends StatelessWidget {
  const Aula06Buttons({super.key});

  void _mostrarMensagem(String tipo) {
    print('Você clicou no botão: $tipo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📖 Aula 06: Botões ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Botões no Flutter:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ElevatedButton: botão com elevação e cor de fundo
            ElevatedButton(
              onPressed: () => _mostrarMensagem('ElevatedButton'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text('ElevatedButton'),
            ),

            const SizedBox(height: 10),

            // TextButton: botão sem borda ou fundo
            TextButton(
              onPressed: () => _mostrarMensagem('TextButton'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('TextButton'),
            ),

            const SizedBox(height: 10),

            // OutlinedButton: botão com borda
            OutlinedButton(
              onPressed: () => _mostrarMensagem('OutlinedButton'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.orange,
                side: const BorderSide(color: Colors.orange),
              ),
              child: const Text('OutlinedButton'),
            ),
          ],
        ),
      ),
    );
  }
}
