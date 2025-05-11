import 'package:flutter/material.dart';

class AulaCheckbox extends StatefulWidget {
  const AulaCheckbox({super.key});

  @override
  State<AulaCheckbox> createState() => _AulaCheckboxState();
}

class _AulaCheckboxState extends State<AulaCheckbox> {
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Checkbox"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text(
              "Comida Brasileira",
            ), // Título exibido ao lado do checkbox
            subtitle: Text(
              "A melhor comida do mundo!!! asjdasdasjdsjdlasjkdjksjlkasjdlkasjlkd",
            ), // Subtítulo (segunda e terceira linha de texto)
            isThreeLine:
                true, // Permite ocupar 3 linhas (título + 2 linhas de subtítulo)
            activeColor: Colors.blue, // Cor do checkbox quando está selecionado
            checkColor:
                Colors.amber, // Cor do símbolo de "check" dentro do checkbox
            selected: true, // Altera a cor do texto quando está selecionado
            dense: true, // Deixa o item mais compacto verticalmente
            controlAffinity:
                ListTileControlAffinity
                    .leading, // Posiciona o checkbox à esquerda
            secondary: Icon(
              Icons.food_bank,
            ), // Ícone exibido ao lado oposto do checkbox
            value:
                _comidaBrasileira, // Estado atual do checkbox (true ou false)
            onChanged: (bool? valor) {
              setState(() {
                _comidaBrasileira =
                    valor ?? false; // Atualiza o estado ao clicar
              });
            },
          ),

          CheckboxListTile(
            title: Text("Comida Mexicana"),
            subtitle: Text(
              "Comida boa, mas não a melhor!!! asjdasdasjdsjdlasjkdjksjlkasjdlkasjlkd",
            ),
            activeColor: Colors.blue,
            selected: true,
            secondary: Icon(Icons.food_bank_outlined),
            value: _comidaMexicana,
            onChanged: (bool? valor) {
              setState(() {
                _comidaMexicana = valor ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}
