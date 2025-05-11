import 'package:flutter/material.dart';

class Aula03Estrutura extends StatelessWidget {
  const Aula03Estrutura({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do app
      appBar: AppBar(
        title: const Text('📖 Aula 03: Estrutura do Flutter'),
        backgroundColor: Colors.deepPurple,
      ),

      // Corpo principal do aplicativo
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Centraliza os conteúdos verticalmente
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.flutter_dash, size: 100, color: Colors.deepPurple),

            SizedBox(height: 20),

            Text(
              'Bem-vindo ao Flutter!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              'Este app está utilizando a estrutura básica do Flutter:\n\n'
              '📦 Scaffold (estrutura base)\n'
              '📌 AppBar (barra superior)\n'
              '🧱 Body (conteúdo principal)\n'
              '➕ FloatingActionButton (botão flutuante)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),

      // Botão flutuante no canto inferior direito
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Você clicou no botão!')),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
