import 'package:flutter/material.dart';

class Aula05Text extends StatelessWidget {
  const Aula05Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📖 Aula 05: Textos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Texto simples com estilo:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Este é um texto personalizado!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Texto com limite de linhas e overflow:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Flutter é um framework incrível para desenvolver aplicações móveis, web e desktop com uma única base de código. Ele é rápido, moderno e muito poderoso.',
              maxLines: 2,
              overflow:
                  TextOverflow.ellipsis, // Usa "..." se ultrapassar limite
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Texto centralizado:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'Centralizado na tela!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
