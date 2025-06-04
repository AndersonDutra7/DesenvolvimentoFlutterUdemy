import 'package:daily_notes/widgets/add_note_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações"),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
        elevation: 8,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddNoteDialog(context),
        backgroundColor: Colors.lightGreen,
        autofocus: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, size: 36, color: Colors.white),
      ),
      // );
    );
  }
}
