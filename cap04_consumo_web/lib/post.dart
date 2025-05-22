// Classe que representa um Post (publicação), como retornado por uma API
class Post {
  // Atributo privado que representa o ID do usuário que criou o post
  int _userId;

  // Atributo privado que representa o ID único do post
  int _id;

  // Atributo privado que representa o título da postagem
  String _title;

  // Atributo privado que representa o conteúdo (corpo) da postagem
  String _body;

  // Construtor da classe, inicializa os 4 atributos com valores fornecidos
  Post(this._userId, this._id, this._title, this._body);

  // Getter do corpo da postagem
  String get body => _body;

  // Setter do corpo da postagem
  set body(String value) {
    _body = value;
  }

  // Getter do título da postagem
  String get title => _title;

  // Setter do título da postagem
  set title(String value) {
    _title = value;
  }

  // Getter do ID do post
  int get id => _id;

  // Setter do ID do post
  set id(int value) {
    _id = value;
  }

  // Getter do ID do usuário
  int get userId => _userId;

  // Setter do ID do usuário
  set userId(int value) {
    _userId = value;
  }
}
