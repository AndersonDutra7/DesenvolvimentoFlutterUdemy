import 'package:flutter/material.dart';

class Aula2MaterialDeseign extends StatelessWidget {
  const Aula2MaterialDeseign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Material')),
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
