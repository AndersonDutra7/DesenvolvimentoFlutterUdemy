import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do aplicativo (usado em alguns dispositivos Android)
      title: 'YouTube Clone',

      // Remove a faixa de debug no canto superior direito
      debugShowCheckedModeBanner: false,

      // Define o tema escuro do aplicativo
      theme: ThemeData.dark().copyWith(
        // Cor de fundo padrão do app
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),

        // Estilo da AppBar (barra superior)
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF0F0F0F),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        // Tema padrão para ícones
        iconTheme: const IconThemeData(color: Colors.white),

        // Estilo dos textos no app
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Texto principal
          bodyMedium: TextStyle(color: Colors.white70), // Texto secundário
        ),
      ),

      // Define a tela inicial do aplicativo
      home: const HomePage(),
    );
  }
}
