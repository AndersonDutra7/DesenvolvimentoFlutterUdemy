/// Model que representa uma anotação com [id], [title] e [description].
class Note {
  int? id;
  final String title;
  final String description;
  final String date;

  /// Construtor da classe [Note].
  Note({
    this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  /// Converte a instância de [Note] para um `Map<String, dynamic>`,
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'description': description, 'date': date};
  }

  /// Cria uma instância de [Note] a partir de um `Map<String, dynamic>`,
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
    );
  }
}
