import 'package:flutter/material.dart';

/// Exibe um diálogo para criação ou edição de uma tarefa
/// Retorna um `Future<String?>` com o texto digitado pelo usuário,
/// ou `null` caso ele cancele a operação.
/// Parâmetros:
/// - [context]: Contexto da árvore de widgets
/// - [initialText]: Texto inicial exibido no campo (útil para edição)
/// - [title]: Título do diálogo
/// - [confirmButtonText]: Texto exibido no botão de confirmação
Future<String?> showTaskDialog({
  required BuildContext context,
  String? initialText,
  required String title,
  required String confirmButtonText,
}) {
  // Variável para armazenar o texto digitado
  String text = initialText ?? '';
  // Controlador do campo de texto, preenchido com valor inicial (se houver)
  final controller = TextEditingController(text: initialText);

  // Exibe o AlertDialog e aguarda retorno
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          autofocus: true, // Abre o teclado automaticamente
          controller: controller, // Controlador vinculado ao campo
          decoration: InputDecoration(hintText: 'Digite o nome da tarefa'),
          onChanged: (value) {
            // Atualiza a variável `text` com o valor digitado
            text = value;
          },
          onSubmitted: (value) {
            // Se pressionar "Enter" e o campo não estiver vazio, fecha o diálogo com o texto
            if (value.trim().isNotEmpty) {
              Navigator.of(context).pop(value);
            }
          },
        ),
        actions: [
          // Botão de cancelar: fecha o diálogo e retorna null
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancelar'),
          ),
          // Botão de confirmação: fecha o diálogo e retorna o texto digitado
          ElevatedButton(
            onPressed: () {
              if (text.trim().isNotEmpty) {
                Navigator.of(context).pop(text);
              }
            },
            child: Text(confirmButtonText),
          ),
        ],
      );
    },
  );
}
