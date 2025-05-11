import 'package:flutter/material.dart';

class Aula11StatesWidgets extends StatelessWidget {
  const Aula11StatesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📖 Aula 11: Stateless vs Stateful'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '🔹 StatelessWidget: Não muda de estado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MeuStateless(),

          Divider(),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '🔸 StatefulWidget: Pode mudar de estado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MeuStateful(),
        ],
      ),
    );
  }
}

// ✅ Exemplo de StatelessWidget (não muda)
class MeuStateless extends StatelessWidget {
  const MeuStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sou um StatelessWidget!', style: TextStyle(fontSize: 16)),
    );
  }
}

// ✅ Exemplo de StatefulWidget (muda com interação)
class MeuStateful extends StatefulWidget {
  const MeuStateful({super.key});

  @override
  State<MeuStateful> createState() => _MeuStatefulState();
}

class _MeuStatefulState extends State<MeuStateful> {
  int contador = 0;

  void _incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Contador: $contador', style: TextStyle(fontSize: 16)),
        ElevatedButton(
          onPressed: _incrementar,
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
