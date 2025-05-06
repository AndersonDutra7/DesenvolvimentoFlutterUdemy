import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(
              32,
            ), // Espaçamento externo (margin interna do Column)
            child: TextField(
              keyboardType:
                  TextInputType.number, // Define o tipo de teclado (número)
              decoration: InputDecoration(
                labelText:
                    "Digite um valor", // Placeholder exibido dentro do campo
              ),
              // enabled: false, // Desabilita o campo
              // maxLength: 2, // Limita o número máximo de caracteres
              // maxLengthEnforced: false, // Não força o limite de caracteres (obsoleto)
              style: TextStyle(
                fontSize: 50, // Tamanho da fonte do texto digitado
                color: Colors.green, // Cor do texto digitado
              ),

              // obscureText: true, // Oculta o texto digitado (usado para senhas) (comentado)

              // Acima: Função chamada a cada caractere digitado
              /*
              onChanged: (String texto) {
                print("valor digitado:" + texto);
              }, 
              */

              // Função chamada ao pressionar "Enter" ou "OK" no teclado
              onSubmitted: (String texto) {
                print("valor digitado:$texto");
              },

              controller:
                  _textEditingController, // Controlador que permite acessar/modificar o texto
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white10,
              backgroundColor: Colors.lightBlue, // Cor de fundo do botão
            ),
            onPressed: () {
              // Função executada quando o botão é pressionado
              print("valor digitado: ${_textEditingController.text}");
            },
            child: Text("Salvar"), // Texto exibido no botão
          ),
        ],
      ),
    );
  }
}
