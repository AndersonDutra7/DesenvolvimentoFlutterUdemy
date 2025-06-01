import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/task_model.dart';

/// Classe responsável por salvar e ler tarefas (Task) do armazenamento local
class TaskStorage {
  /// Obtém o arquivo local onde as tarefas serão salvas (tasks.json)
  /// Usa o diretório de documentos do app, garantindo compatibilidade com Android e iOS
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/tasks.json');
  }

  /// Lê as tarefas salvas no arquivo JSON
  /// Retorna uma lista de objetos `Task`. Se não houver arquivo ou houver erro, retorna lista vazia.
  Future<List<Task>> readTasks() async {
    try {
      final file = await _getFile();
      // Verifica se o arquivo existe antes de tentar ler
      if (await file.exists()) {
        final content = await file.readAsString();
        // Decodifica o conteúdo do JSON e mapeia para uma lista de objetos Task
        final data = json.decode(content) as List;
        return data.map((e) => Task.fromJson(e)).toList();
      }
      // Log de erro
    } catch (e) {
      print('Erro ao ler as tarefas: $e');
    }
    // Se ocorrer erro ou arquivo não existir, retorna lista vazia
    return [];
  }

  /// Salva a lista de tarefas no arquivo local como JSON
  /// Converte os objetos `Task` em JSON antes de gravar no arquivo
  Future<void> saveTasks(List<Task> tasks) async {
    final file = await _getFile();
    final jsonData = json.encode(tasks.map((e) => e.toJson()).toList());
    await file.writeAsString(jsonData);
  }
}
