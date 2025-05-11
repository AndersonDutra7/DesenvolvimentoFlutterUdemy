import 'package:flutter/material.dart';

class Aula12GestureDetector extends StatefulWidget {
  const Aula12GestureDetector({super.key});

  @override
  State<Aula12GestureDetector> createState() => _Aula12GestureDetectorState();
}

class _Aula12GestureDetectorState extends State<Aula12GestureDetector> {
  String _mensagem = 'Toque na caixa!';

  void _atualizarMensagem(String novoTexto) {
    setState(() {
      _mensagem = novoTexto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📖 Aula 12: GestureDetector'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              // Detecta toque simples
              onTap: () => _atualizarMensagem('👆 Toque simples detectado!'),

              // Detecta toque duplo
              onDoubleTap:
                  () => _atualizarMensagem('✌️ Toque duplo detectado!'),

              // Detecta toque longo
              onLongPress: () => _atualizarMensagem('✋ Toque longo detectado!'),

              // Caixa onde o gesto é detectado
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '👆 Toque Aqui',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(_mensagem, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
