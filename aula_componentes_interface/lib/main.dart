import 'package:aula_componentes_interface/aula3_estrutura.dart';
import 'package:aula_componentes_interface/aula4_rowns_coluns.dart';
import 'package:aula_componentes_interface/aula5_texts.dart';
import 'package:aula_componentes_interface/aula6_buttons.dart';
import 'package:aula_componentes_interface/aula7_paddings_margins.dart';
import 'package:flutter/material.dart';
import 'aula2_material_deseign.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Material',
      home: Aula7PaddingsMargins(),
      debugShowCheckedModeBanner: false,
    );
  }
}
