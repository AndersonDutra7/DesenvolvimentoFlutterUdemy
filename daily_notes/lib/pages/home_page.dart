import 'package:daily_notes/data/database/notes_database.dart';
import 'package:flutter/material.dart';
import 'package:daily_notes/data/models/note_model.dart';
import 'package:daily_notes/widgets/add_note_dialog.dart';
import 'package:daily_notes/widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final allNotes = await NotesDatabase.instance.getNotes();

    // Ordenar por data (do mais recente para o mais antigo)
    allNotes.sort((a, b) => b.date.compareTo(a.date));

    setState(() {
      notes = allNotes;
    });
  }

  Future<void> _addNote() async {
    await showAddNoteDialog(context);
    await _loadNotes();
  }

  Future<void> _deleteNote(Note note) async {
    if (note.id == null) return;
    await NotesDatabase.instance.deleteNote(note.id!);
    await _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações"),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        elevation: 8,
      ),
      body:
          notes.isEmpty
              ? const Center(child: Text("Nenhuma anotação ainda"))
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(
                    note: note,
                    onEdit: () async {
                      await showAddNoteDialog(context, noteToEdit: note);
                      await _loadNotes();
                    },

                    onDelete: () => _deleteNote(note),
                  );
                },
              ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(),
        backgroundColor: Colors.lightGreen,
        autofocus: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, size: 36, color: Colors.white),
      ),
    );
  }
}
