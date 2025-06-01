import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_item.dart';
import '../widgets/task_dialog.dart';
import '../services/task_storage.dart';

/// Página principal do app de tarefas.
/// Exibe a lista de tarefas e permite adicionar, editar,
/// concluir e excluir tarefas.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista local de tarefas
  final List<Task> _tasks = [];
  // Instaâcia o TaskStorage
  final TaskStorage _storage = TaskStorage();

  // Método para iniciar com os dados salvos localmente
  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // Leitura das tarefas salvas localmente
  Future<void> _loadTasks() async {
    final loadedTasks = await _storage.readTasks();
    setState(() {
      _tasks.addAll(loadedTasks);
    });
  }

  // Salva as novas tarefas localmente
  Future<void> _saveTasks() async {
    await _storage.saveTasks(_tasks);
  }

  /// Adiciona uma nova tarefa à lista
  void _addTask(String title) {
    if (title.trim().isEmpty) return;
    setState(() {
      _tasks.add(Task(title: title));
    });
    _saveTasks();
  }

  /// Edita o título de uma tarefa existente
  void _editTask(int index, String newTitle) {
    if (newTitle.trim().isEmpty) return;
    setState(() {
      _tasks[index].title = newTitle;
    });
    _saveTasks();
  }

  /// Alterna o status de concluída da tarefa
  void _toggleTask(Task task, bool? value) {
    setState(() {
      task.completed = value ?? false;
    });
  }

  /// Remove uma tarefa da lista e permite desfazer a ação
  void _deleteTask(int index) {
    final removedTask = _tasks[index];
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();

    // Mostra um SnackBar com opção de desfazer
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Tarefa removida'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _tasks.insert(index, removedTask);
            });
            _saveTasks();
          },
        ),
      ),
    );
  }

  /// Exibe o componente task_dialog para adicionar nova tarefa
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

  /// Exibe o componente task_dialog para editar uma tarefa existente
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

          // Quadro com efeito vidro fosco contendo a lista de tarefas
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
                    // Fundo translúcido
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child:
                      _tasks.isEmpty
                          // Mensagem de lista vazia
                          ? const Center(
                            child: Text(
                              'Nenhuma tarefa adicionada!',
                              style: TextStyle(color: Colors.black87),
                            ),
                          )
                          // Lista de tarefas com scroll
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
      // Botão flutuante para adicionar tarefas
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B4513),
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add, size: 36, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
