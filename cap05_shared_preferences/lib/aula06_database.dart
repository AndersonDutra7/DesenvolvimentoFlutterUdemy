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
    _salvarUsuarioSQLite();
    _listarUsuariosSQLite();

    // Inicializando Hive (recomendado para Web e também pode ser usado em mobile)
    _initHive();
  }

  // Inicialização e uso do Hive
  Future<void> _initHive() async {
    // Inicializa o Hive (necessário para Web)
    await Hive.initFlutter();

    // Abre (ou cria, se não existir) a box "usuarios"
    await Hive.openBox("usuarios");

    // Inicia os métodos Hive
    await _salvarUsuarioHive();
    await _listarUsuariosHive();
    await _listarUsuariosHiveComFiltro();
    await _listarUsuarioHivePorId(1);
    await _excluirUsuarioHive(1);
    await _atualizarUsuarioHive(1);
  }

  // Inicialização e uso do SQLite
  Future<Database> _abrirBancoSQLite() async {
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

  // Método para salvar um usuário no banco SQLite
  Future<void> _salvarUsuarioSQLite() async {
    try {
      Database bd = await _abrirBancoSQLite();
      Map<String, dynamic> dados = {"nome": "Maria Silva", "idade": 58};
      int id = await bd.insert("usuarios", dados);
      print("Salvo com SQLite: $id");
      await bd.close();
    } catch (e) {
      print("Erro ao salvar com SQLite: $e");
    }
  }

  // Método para listar usuários usando SQLite (Android/iOS)
  Future<void> _listarUsuariosSQLite() async {
    try {
      Database bd = await _abrirBancoSQLite();

      // Exemplo de consulta SQL com filtro e ordenação
      //String sql = "SELECT * FROM usuarios WHERE id = 5 ";
      //String sql = "SELECT * FROM usuarios WHERE idade >= 30 AND idade <= 58";
      //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 46 ";
      //String sql = "SELECT * FROM usuarios WHERE idade IN (18,30) ";
      //String filtro = "an";
      //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%" + filtro + "%' ";
      //String sql = "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) DESC ";//ASC, DESC
      String sql =
          "SELECT *, UPPER(nome) as nomeMaiu FROM usuarios WHERE 1=1 ORDER BY idade DESC LIMIT 3"; //ASC, DESC

      List usuarios = await bd.rawQuery(sql);

      for (var usuario in usuarios) {
        print(
          "SQLite -> ID: ${usuario['id']}, Nome: ${usuario['nome']}, Idade: ${usuario['idade']}",
        );
      }

      await bd.close();
    } catch (e) {
      print("Erro ao listar usuários com SQLite: $e");
    }
  }

  // Método para listar um usuário específico pelo ID usando SQLite
  Future<void> _listarUsuarioSQLitePorId(int id) async {
    try {
      Database bd = await _abrirBancoSQLite();

      List usuarios = await bd.query(
        "usuarios",
        columns: ["id", "nome", "idade"],
        where: "id = ?",
        whereArgs: [id],
      );

      for (var usuario in usuarios) {
        print(
          "SQLite (Por ID) -> ID: ${usuario['id']}, Nome: ${usuario['nome']}, Idade: ${usuario['idade']}",
        );
      }

      await bd.close();
    } catch (e) {
      print("Erro ao listar usuário por ID com SQLite: $e");
    }
  }

  // Método para excluir um usuário do SQLite
  Future<void> _excluirUsuarioSQLite(int id) async {
    try {
      Database bd = await _abrirBancoSQLite();

      int linhasAfetadas = await bd.delete(
        "usuarios",
        where: "id = ?",
        whereArgs: [id],
      );

      print("Usuário excluído com SQLite: $linhasAfetadas linha(s) afetada(s)");

      await bd.close();
    } catch (e) {
      print("Erro ao excluir usuário com SQLite: $e");
    }
  }

  // Método para atualizar um usuário no SQLite
  Future<void> _atualizarUsuarioSQLite(int id) async {
    try {
      Database bd = await _abrirBancoSQLite();

      Map<String, dynamic> dadosAtualizados = {
        "nome": "Mariana Almeida",
        "idade": 18,
      };

      int linhasAfetadas = await bd.update(
        "usuarios",
        dadosAtualizados,
        where: "id = ?",
        whereArgs: [id],
      );

      print(
        "Usuário atualizado com SQLite: $linhasAfetadas linha(s) afetada(s)",
      );

      await bd.close();
    } catch (e) {
      print("Erro ao atualizar usuário com SQLite: $e");
    }
  }

  // Salva um usuário dentro da box 'usuarios' no Hive
  Future<void> _salvarUsuarioHive() async {
    final box = Hive.box("usuarios");

    Map<String, dynamic> usuario = {"nome": "Teddy Dutra", "idade": 3};
    await box.add(usuario);
    print("Usuário salvo com Hive");
  }

  // Lista todos os usuários salvos no Hive
  Future<void> _listarUsuariosHive() async {
    final box = Hive.box("usuarios");

    box.toMap().forEach((key, value) {
      print("ID: $key, Nome: ${value['nome']}, Idade: ${value['idade']}");
    });
  }

  // Lista os usuários do Hive com filtro e ordenação semelhante ao SQL
  Future<void> _listarUsuariosHiveComFiltro() async {
    final box = Hive.box("usuarios");

    // Converte o box em lista de Map<String, dynamic>
    List<Map> usuarios = box.values.cast<Map>().toList();

    // Ordena por idade decrescente e limita a 3 resultados
    usuarios.sort((a, b) => b["idade"].compareTo(a["idade"]));
    usuarios = usuarios.take(3).toList();

    for (var i = 0; i < usuarios.length; i++) {
      var usuario = usuarios[i];
      print("Hive -> Nome: ${usuario['nome']}, Idade: ${usuario['idade']}");
    }
  }

  // Método para listar um usuário específico pelo ID (key) no Hive
  Future<void> _listarUsuarioHivePorId(int id) async {
    try {
      final box = Hive.box("usuarios");

      final usuario = box.get(id);
      if (usuario != null) {
        print(
          "Hive (Por ID) -> ID: $id, Nome: ${usuario['nome']}, Idade: ${usuario['idade']}",
        );
      } else {
        print("Usuário com ID $id não encontrado no Hive.");
      }
    } catch (e) {
      print("Erro ao listar usuário por ID com Hive: $e");
    }
  }

  // Método para excluir um usuário no Hive usando o ID (key)
  Future<void> _excluirUsuarioHive(int id) async {
    try {
      final box = Hive.box("usuarios");

      await box.delete(id);
      print("Usuário com ID $id excluído do Hive.");
    } catch (e) {
      print("Erro ao excluir usuário com Hive: $e");
    }
  }

  // Método para atualizar um usuário no Hive usando o ID (key)
  Future<void> _atualizarUsuarioHive(int id) async {
    try {
      final box = Hive.box("usuarios");

      Map<String, dynamic> novosDados = {
        "nome": "Mariana Almeida",
        "idade": 18,
      };

      await box.put(id, novosDados);
      print("Usuário com ID $id atualizado no Hive.");
    } catch (e) {
      print("Erro ao atualizar usuário com Hive: $e");
    }
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
