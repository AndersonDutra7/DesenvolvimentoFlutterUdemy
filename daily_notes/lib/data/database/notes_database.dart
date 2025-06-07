import 'package:daily_notes/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Singleton responsável por gerenciar o banco de dados SQLite da aplicação.
class NotesDatabase {
  /// Instância única da classe (padrão Singleton).
  static final NotesDatabase instance = NotesDatabase._init();

  /// Referência interna ao banco de dados.
  static Database? _database;

  /// Construtor privado para evitar múltiplas instâncias.
  NotesDatabase._init();

  /// Getter assíncrono para obter o banco de dados.
  /// Se já estiver inicializado, retorna o existente; caso contrário, inicializa.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  /// Inicializa o banco de dados criando o arquivo no caminho correto.
  Future<Database> _initDB(String filePath) async {
    // Obtém o caminho padrão onde o banco de dados deve ser salvo
    final dbPath = await getDatabasesPath();
    // Cria o caminho completo para o arquivo do banco
    final path = join(dbPath, filePath);

    // Abre (ou cria) o banco de dados
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /// Executado automaticamente na criação do banco.
  /// Cria a tabela 'notes' com colunas: id, title e description.
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  /// Insere uma nova anotação no banco de dados.
  /// Retorna o ID do novo registro.
  Future<int> insertNote(Note note) async {
    final db = await instance.database;
    return await db.insert('notes', note.toMap());
  }

  /// Recupera todas as anotações armazenadas no banco de dados.
  /// Converte cada linha do resultado em uma instância de Note.
  Future<List<Note>> getNotes() async {
    final db = await instance.database;
    final maps = await db.query('notes');

    return maps.map((map) => Note.fromMap(map)).toList();
  }

  // Atualizar determinada nota pelo ID
  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Excluir determinada nota pelo ID
  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  /// Fecha a conexão com o banco de dados.
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
