import 'dart:convert';

class BookDetail {
  final int id;
  final String title;
  final String author;
  final String coverPhoto;
  final String synopsis;
  BookDetail({
    required this.id,
    required this.title,
    required this.author,
    required this.coverPhoto,
    required this.synopsis,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'cover_photo': coverPhoto,
      'synopsis': synopsis,
    };
  }

  factory BookDetail.fromMap(Map<String, dynamic> map) {
    return BookDetail(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      coverPhoto: map['cover_photo'],
      synopsis: map['synopsis'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookDetail.fromJson(String source) =>
      BookDetail.fromMap(json.decode(source));
}
