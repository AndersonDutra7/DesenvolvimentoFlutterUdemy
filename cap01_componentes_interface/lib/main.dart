import 'package:aula_componentes_interface/aula01_widgets.dart';
import 'package:aula_componentes_interface/aula02_material_deseign.dart';
import 'package:aula_componentes_interface/aula03_estrutura.dart';
import 'package:aula_componentes_interface/aula04_rowns_coluns.dart';
import 'package:aula_componentes_interface/aula05_texts.dart';
import 'package:aula_componentes_interface/aula06_buttons.dart';
import 'package:aula_componentes_interface/aula07_paddings_margins.dart';
import 'package:aula_componentes_interface/aula08_alinhamentos.dart';
import 'package:aula_componentes_interface/aula09_imagens.dart';
import 'package:aula_componentes_interface/aula10_scaffold.dart';
import 'package:aula_componentes_interface/aula11_states_widgets.dart';
import 'package:aula_componentes_interface/aula12_gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Material',
      home: Aula12GestureDetector(),
      debugShowCheckedModeBanner: false,
    );
  }
}
