/// Modelo de dados que representa uma tarefa (Task)
class Task {
  /// Título da tarefa
  String title;

  /// Estado da tarefa: `true` se estiver concluída, `false` caso contrário
  bool completed;

  /// Construtor da classe Task
  /// [title] é obrigatório, enquanto [completed] é opcional com valor padrão `false`
  Task({required this.title, this.completed = false});

  /// Converte a instância da Task para um `Map` (usado para salvar como JSON)
  Map<String, dynamic> toJson() => {'title': title, 'completed': completed};

  /// Cria uma instância de Task a partir de um `Map` (usado para ler JSON)
  /// Garante valores padrão caso algum campo esteja ausente no JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] ?? '',
      completed: json['completed'] ?? false,
    );
  }
}
