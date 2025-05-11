import 'package:flutter/material.dart';

class Aula3Estrutura extends StatelessWidget {
  const Aula3Estrutura({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página Inicial')),
      body: const Center(child: Text('Bem-vindo ao Flutter!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
