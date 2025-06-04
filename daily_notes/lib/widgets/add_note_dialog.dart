import 'package:flutter/material.dart';

Future<void> showAddNoteDialog(BuildContext context) async {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text("Adicionar anotação"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                      color: Colors.black87,
                    ),
                    labelText: "Título",
                    hintText: "Digite um título",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                      color: Colors.black87,
                    ),
                    labelText: "Descrição",
                    hintText: "Digite uma descrição",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();

                if (title.isNotEmpty && description.isNotEmpty) {
                  print('Título: $title');
                  print('Descrição: $description');

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos')),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
  );
}
