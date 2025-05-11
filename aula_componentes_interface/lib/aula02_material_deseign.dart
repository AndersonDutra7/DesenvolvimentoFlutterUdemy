import 'package:flutter/material.dart';

class Aula02MaterialDeseign extends StatelessWidget {
  const Aula02MaterialDeseign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('📖 Aula 02: Exemplo Material')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Botão pressionado');
          },
          child: Text('Clique Aqui'),
        ),
      ),
    );
  }
}
