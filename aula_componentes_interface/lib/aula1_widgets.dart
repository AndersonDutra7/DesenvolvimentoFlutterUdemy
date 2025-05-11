import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Meu Primeiro Widget')),
        body: Center(child: Text('Olá, Mundo!')),
      ),
    );
  }
}
