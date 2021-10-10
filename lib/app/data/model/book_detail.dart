import 'dart:convert';

class BookDetailInfo {
  final int id;
  final String title;
  final String author;
  final String coverPhoto;
  final String synopsis;
  BookDetailInfo({
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

  factory BookDetailInfo.fromMap(Map<String, dynamic> map) {
    return BookDetailInfo(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      coverPhoto: map['cover_photo'],
      synopsis: map['synopsis'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookDetailInfo.fromJson(String source) =>
      BookDetailInfo.fromMap(json.decode(source));
}
