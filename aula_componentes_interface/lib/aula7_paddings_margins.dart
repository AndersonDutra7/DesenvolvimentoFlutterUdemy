import 'package:flutter/material.dart';

class Aula7PaddingsMargins extends StatelessWidget {
  const Aula7PaddingsMargins({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Espaçamentos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding geral da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container com padding e margin
            Container(
              margin: const EdgeInsets.only(bottom: 16.0), // Espaço externo
              padding: const EdgeInsets.all(12.0), // Espaço interno
              color: Colors.blue.shade100,
              child: const Text(
                '🔹 Container com padding e margin',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Espaçamento fixo usando SizedBox
            const SizedBox(height: 20),

            // Exemplo com Spacer em Row
            Row(
              children: const [
                Text('Início'),
                Spacer(), // Espaço flexível entre os textos
                Text('Meio'),
                Spacer(flex: 2), // Espaço ainda maior
                Text('Fim'),
              ],
            ),

            const SizedBox(height: 20),

            // Exemplo com Padding direto no Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Text(
                '🔸 Texto com Padding Interno',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // Espaço visual para mostrar efeito de margin e padding com Container
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('🔸 Outro exemplo com margin + padding'),
            ),
          ],
        ),
      ),
    );
  }
}
