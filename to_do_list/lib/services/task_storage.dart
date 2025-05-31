import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/task_model.dart';

class TaskStorage {
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/tasks.json');
  }

  Future<List<Task>> readTasks() async {
    try {
      final file = await _getFile();
      if (await file.exists()) {
        final content = await file.readAsString();
        final data = json.decode(content) as List;
        return data.map((e) => Task.fromJson(e)).toList();
      }
    } catch (e) {
      // log erro se quiser
    }
    return [];
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final file = await _getFile();
    final jsonData = json.encode(tasks.map((e) => e.toJson()).toList());
    await file.writeAsString(jsonData);
  }
}
