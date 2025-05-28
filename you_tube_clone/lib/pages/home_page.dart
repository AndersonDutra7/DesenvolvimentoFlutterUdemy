// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:you_tube_clone/models/video.dart';
import 'package:you_tube_clone/search/custom_search_delegate.dart';
import 'inicio_page.dart';
import 'shorts_page.dart';
import 'inscricoes_page.dart';
import 'biblioteca_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variável que armazena qual aba (ícone) está selecionada.
  int _selectedIndex = 0;

  // Lista de widgets correspondentes às páginas exibidas no corpo da tela.
  final List<Widget> _pages = [
    const InicioPage(),
    const ShortsPage(),
    const InscricoesPage(),
    const BibliotecaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 48,
          child: Image.asset("assets/images/logo.PNG"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cast),
            onPressed: () {
              print("Transmissão");
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {
              print("Notificações");
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            // Chamando a pesquisa do SearchDelegate
            onPressed: () async {
              final result = await showSearch<Video?>(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              if (result != null) {
                print("Vídeo selecionado: ${result.titulo}");
              }
            },
          ),
        ],
      ),
      // Mostra a página correspondente ao índice selecionado (_selectedIndex).
      body: Container(
        padding: EdgeInsets.all(16),
        child: _pages[_selectedIndex],
      ),
      // Botton Bar com 4 seções
      bottomNavigationBar: BottomNavigationBar(
        // Índice do item atualmente selecionado (destacado)
        currentIndex: _selectedIndex,
        // Cor do ícone/texto do item selecionado
        selectedItemColor: Colors.white,
        // Cor do ícone/texto dos itens não selecionados
        unselectedItemColor: Colors.white70,
        // Cor de fundo da barra de navegação inferior
        backgroundColor: const Color(0xFF0F0F0F),
        // Define que todos os itens serão exibidos com tamanho fixo
        type: BottomNavigationBarType.fixed,
        // Função chamada ao tocar em um item da barra
        onTap: (index) {
          print("Índice selecionado: $index"); // DEBUG
          // Atualiza o estado para mudar a aba selecionada
          setState(() {
            _selectedIndex = index;
          });
        },

        // Lista de itens da barra de navegação inferior
        items: const [
          BottomNavigationBarItem(
            // Ícone exibido quando o item não está selecionado (outline)
            icon: Icon(Icons.home_outlined),
            // Ícone exibido quando o item está selecionado (preenchido)
            activeIcon: Icon(Icons.home),
            // Texto do item
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Inscrições',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            activeIcon: Icon(Icons.folder),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
