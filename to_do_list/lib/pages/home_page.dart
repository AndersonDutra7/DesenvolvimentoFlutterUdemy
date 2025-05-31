import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_item.dart';
import '../widgets/task_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [];

  void _addTask(String title) {
    if (title.trim().isEmpty) return;
    setState(() {
      _tasks.add(Task(title: title));
    });
  }

  void _editTask(int index, String newTitle) {
    if (newTitle.trim().isEmpty) return;
    setState(() {
      _tasks[index].title = newTitle;
    });
  }

  void _toggleTask(Task task, bool? value) {
    setState(() {
      task.completed = value ?? false;
    });
  }

  void _deleteTask(int index) {
    final removedTask = _tasks[index];
    setState(() {
      _tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Tarefa removida'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _tasks.insert(index, removedTask);
            });
          },
        ),
      ),
    );
  }

  void _showAddTaskDialog() async {
    final newTaskTitle = await showTaskDialog(
      context: context,
      title: 'Nova tarefa',
      confirmButtonText: 'Adicionar',
    );

    if (newTaskTitle != null && newTaskTitle.trim().isNotEmpty) {
      _addTask(newTaskTitle);
    }
  }

  void _showEditTaskDialog(int index) async {
    final editedTitle = await showTaskDialog(
      context: context,
      title: 'Editar tarefa',
      initialText: _tasks[index].title,
      confirmButtonText: 'Salvar',
    );

    if (editedTitle != null && editedTitle.trim().isNotEmpty) {
      _editTask(index, editedTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo com imagem
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fundo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/images/titulo_mobile.png",
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Quadro vidro fosco com tarefas
          Positioned(
            top: 180,
            left: 16,
            right: 16,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child:
                      _tasks.isEmpty
                          ? const Center(
                            child: Text(
                              'Nenhuma tarefa adicionada!',
                              style: TextStyle(color: Colors.black87),
                            ),
                          )
                          : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                _tasks.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TaskItem(
                                    task: _tasks[index],
                                    index: index,
                                    onToggle:
                                        (value) =>
                                            _toggleTask(_tasks[index], value),
                                    onEdit: () => _showEditTaskDialog(index),
                                    onDelete: () => _deleteTask(index),
                                  ),
                                ),
                              ),
                            ),
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B4513),
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add, size: 36, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
