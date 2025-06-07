import 'package:flutter/material.dart';
import 'package:daily_notes/data/models/note_model.dart';
import 'package:daily_notes/data/database/notes_database.dart';

Future<void> showAddNoteDialog(BuildContext context, {Note? noteToEdit}) async {
  final TextEditingController titleController = TextEditingController(
    text: noteToEdit?.title ?? '',
  );
  final descriptionController = TextEditingController(
    text: noteToEdit?.description ?? '',
  );

  final FocusNode titleFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();

  Future<void> saveNote() async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      final now = DateTime.now();

      if (noteToEdit == null) {
        final note = Note(
          title: title,
          description: description,
          date: now.toIso8601String(),
        );

        await NotesDatabase.instance.insertNote(note);
      } else {
        final updatedNote = Note(
          id: noteToEdit.id,
          title: title,
          description: description,
          date: now.toIso8601String(),
        );

        await NotesDatabase.instance.updateNote(updatedNote);
      }

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Preencha todos os campos')));
    }
  }

  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(
            noteToEdit == null ? "Adicionar anotação" : "Editar anotação",
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  focusNode: titleFocus,
                  textInputAction: TextInputAction.next,
                  onSubmitted:
                      (_) =>
                          FocusScope.of(context).requestFocus(descriptionFocus),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
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
                  focusNode: descriptionFocus,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => saveNote(),
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
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
              onPressed: saveNote,
              child: const Text('Salvar'),
            ),
          ],
        ),
  );
}
