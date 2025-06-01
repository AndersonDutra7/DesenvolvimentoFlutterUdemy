// lib/widgets/task_item.dart

import 'package:flutter/material.dart';
import '../models/task_model.dart';

/// Widget que representa um item da lista de tarefas.
/// Exibe o título da tarefa, permite marcar como concluída,
/// editar e excluir a tarefa com gestos ou botões.
/// Parâmetros:
/// - [task]: Instância da tarefa a ser exibida.
/// - [index]: Índice da tarefa na lista (usado na chave).
/// - [onToggle]: Função chamada ao marcar/desmarcar o checkbox.
/// - [onEdit]: Função chamada ao clicar no botão de edição.
/// - [onDelete]: Função chamada ao excluir a tarefa (via swipe).
class TaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final ValueChanged<bool?> onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.index,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Widget que permite deslizar para excluir
        Dismissible(
          // Chave única para identificar o widget na lista
          key: Key(task.title + index.toString()),
          // Fundo vermelho com ícone de lixeira ao deslizar
          background: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          // Direção do deslizamento: da esquerda para a direita
          direction: DismissDirection.startToEnd,
          // Ao deslizar, chama o método de exclusão
          onDismissed: (direction) => onDelete(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    // line.Through deixa a tarefa riscada se estiver concluída
                    decoration:
                        task.completed ? TextDecoration.lineThrough : null,
                  ),
                  // Evita quebra de linha
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Checkbox + botão de editar
              Row(
                children: [
                  Checkbox(
                    value: task.completed,
                    onChanged: onToggle,
                    activeColor: Colors.green,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black87,
                      size: 28,
                    ),
                    onPressed: onEdit,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Linha divisória entre itens da lista
        const Divider(
          color: Colors.grey,
          thickness: 1,
          height: 20,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
