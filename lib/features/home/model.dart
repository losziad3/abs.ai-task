class Note {
  final String id;
  final String title;
  final String content;
  final String date;
  final List<String> collaborators;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.collaborators,
  });

  factory Note.fromMap(Map<String, dynamic> data, String id) {
    return Note(
      id: id,
      title: data['title'],
      content: data['content'],
      date: data['date'],
      collaborators: List<String>.from(data['collaborators'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'collaborators': collaborators,
    };
  }
}
