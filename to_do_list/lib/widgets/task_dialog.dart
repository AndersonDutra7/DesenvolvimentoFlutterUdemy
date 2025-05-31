import 'package:flutter/material.dart';

Future<String?> showTaskDialog({
  required BuildContext context,
  String? initialText,
  required String title,
  required String confirmButtonText,
}) {
  String text = initialText ?? '';
  final controller = TextEditingController(text: initialText);

  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(hintText: 'Digite o nome da tarefa'),
          onChanged: (value) {
            text = value;
          },
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              Navigator.of(context).pop(value);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancelar'),
          ),
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
