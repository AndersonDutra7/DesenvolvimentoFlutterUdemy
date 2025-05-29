import 'package:flutter/material.dart';

class Aula02 extends StatefulWidget {
  const Aula02({super.key});

  @override
  _Aula02State createState() => _Aula02State();
}

class _Aula02State extends State<Aula02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
        backgroundColor: Colors.purple,
      ),

      // Conteúdo central da tela
      body: Center(
        child: Text("Conteúdo principal", style: TextStyle(fontSize: 18)),
      ),

      // Define a posição do botão flutuante (centralizado na parte inferior)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Botão flutuante estendido com ícone e texto
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // print("Botão pressionado!");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Item adicionado!")));
        },
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
      ),

      // Barra inferior com ícones
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // Dá espaço para o FAB
        notchMargin: 8.0, // Espaço entre o botão e a barra
        color: Colors.purple.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print("Ícone Home pressionado");
              },
            ),
          ],
        ),
      ),
    );
  }
}
