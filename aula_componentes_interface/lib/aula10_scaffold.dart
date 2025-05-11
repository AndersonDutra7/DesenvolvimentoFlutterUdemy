import 'package:flutter/material.dart';

class Aula10Scaffold extends StatelessWidget {
  const Aula10Scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📖 Aula 10: Scaffold'),
        backgroundColor: Colors.deepPurple,
      ),

      // Corpo principal do app
      body: const Center(
        child: Text('Bem-vindo ao Scaffold!', style: TextStyle(fontSize: 20)),
      ),

      // Botão flutuante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ação ao clicar
          debugPrint('Botão flutuante clicado');
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),

      // Menu lateral (Drawer)
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Início')),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
          ],
        ),
      ),

      // Barra inferior (BottomNavigationBar)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
