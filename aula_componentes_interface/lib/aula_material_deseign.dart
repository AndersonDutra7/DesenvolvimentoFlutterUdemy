import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo Material')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print('Botão pressionado');
            },
            child: Text('Clique Aqui'),
          ),
        ),
      ),
    ),
  );
}
