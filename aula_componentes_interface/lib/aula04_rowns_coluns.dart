import 'package:flutter/material.dart';

class Aula04RowAndColumn extends StatelessWidget {
  const Aula04RowAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📖 Aula 04: Rowns e Columns')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Organiza os widgets verticalmente
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Exemplo de Column:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Item 1'),
            const Text('Item 2'),
            const Text('Item 3'),
            const Divider(height: 30),

            const Text(
              'Exemplo de Row:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              // Organiza os widgets horizontalmente
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.home, size: 40, color: Colors.teal),
                Icon(Icons.favorite, size: 40, color: Colors.pink),
                Icon(Icons.settings, size: 40, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
