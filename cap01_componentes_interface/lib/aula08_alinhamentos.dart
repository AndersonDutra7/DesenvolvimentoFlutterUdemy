import 'package:flutter/material.dart';

class Aula08Alinhamentos extends StatelessWidget {
  const Aula08Alinhamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📖 Aula 08: Alinhamentos')),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // 1. Center
          const Text(
            '🔹 Exemplo com Center:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Center(
            child: Container(
              color: Colors.blue.shade100,
              width: 200,
              height: 50,
              child: const Center(child: Text('Texto Centralizado')),
            ),
          ),

          const SizedBox(height: 30),

          // 2. Alinhamento personalizado com Align
          const Text(
            '🔸 Exemplo com Alignment.topRight:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.orange.shade100,
            width: 200,
            height: 100,
            child: const Align(
              alignment: Alignment.topRight,
              child: Text('Topo Direita'),
            ),
          ),

          const SizedBox(height: 30),

          // 3. MainAxisAlignment e CrossAxisAlignment em Row
          const Text(
            '🔹 MainAxisAlignment e CrossAxisAlignment (Row):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.green.shade100,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.star, size: 30),
                Text('Item Central', style: TextStyle(fontSize: 18)),
                Icon(Icons.favorite, size: 30),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 4. MainAxisAlignment e CrossAxisAlignment em Column
          const Text(
            '🔸 MainAxisAlignment e CrossAxisAlignment (Column):',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.purple.shade100,
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text('Item 1'), Text('Item 2'), Text('Item 3')],
            ),
          ),
        ],
      ),
    );
  }
}
