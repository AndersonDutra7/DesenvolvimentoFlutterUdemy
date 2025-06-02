import 'package:flutter/material.dart';

// Pacote de banco de dados local para Android/iOS (SQLite)
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Pacote de banco de dados local para Web (e também funciona no mobile): Hive
import 'package:hive_flutter/hive_flutter.dart';

class Aula06 extends StatefulWidget {
  const Aula06({super.key});

  @override
  State<Aula06> createState() => _Aula06State();
}

class _Aula06State extends State<Aula06> {
  @override
  void initState() {
    super.initState();

    // Salvando dados usando SQLite (usado apenas no Android/iOS)
    _salvarDB();

    // Inicializando Hive (recomendado para Web e também pode ser usado em mobile)
    _initHive();
  }

  // Inicialização e uso do Hive
  Future<void> _initHive() async {
    // Inicializa o Hive (necessário para Web)
    await Hive.initFlutter();

    // Abre (ou cria, se não existir) a box "usuarios"
    await Hive.openBox("usuarios");

    // Salva e lista usuários utilizando Hive
    _salvarUsuario();
    _listarUsuarios();
  }

  // Inicialização e uso do SQLite
  Future<Database> _recuperarDB() async {
    // Recupera o caminho do banco de dados local
    final caminho = await getDatabasesPath();

    // Cria o caminho completo do banco com nome 'banco.db'
    final local = join(caminho, "banco.db");

    // Abre o banco com versão e cria a tabela se não existir
    return openDatabase(
      local,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)",
        );
      },
    );
  }

  // Função para salvar um usuário no banco SQLite
  Future<void> _salvarDB() async {
    try {
      Database bd = await _recuperarDB();
      Map<String, dynamic> dados = {"nome": "Maria Silva", "idade": 58};
      int id = await bd.insert("usuarios", dados);
      print("Salvo com SQLite: $id");
      await bd.close();
    } catch (e) {
      print("Erro ao salvar com SQLite: $e");
    }
  }

  // Salva um usuário dentro da box 'usuarios' no Hive
  Future<void> _salvarUsuario() async {
    final box = Hive.box("usuarios");

    Map<String, dynamic> usuario = {"nome": "Teddy Dutra", "idade": 3};
    await box.add(usuario);
    print("Usuário salvo com Hive");
  }

  // Lista todos os usuários salvos no Hive
  Future<void> _listarUsuarios() async {
    final box = Hive.box("usuarios");

    box.toMap().forEach((key, value) {
      print("ID: $key, Nome: ${value['nome']}, Idade: ${value['idade']}");
    });
  }

  // Interface da aplicação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Banco de Dados")),
      body: Center(child: Text("Veja o console")),
    );
  }
}
