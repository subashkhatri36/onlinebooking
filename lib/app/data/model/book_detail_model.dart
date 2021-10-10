import 'dart:convert';

class BookDetail {
  final String authorId;
  final String title;
  final String coverPhoto;
  final String author;
  final String synopsis;
  final String pdffile;
  BookDetail({
    required this.authorId,
    required this.title,
    required this.coverPhoto,
    required this.author,
    required this.synopsis,
    required this.pdffile,
  });

  Map<String, dynamic> toMap() {
    return {
      'authorId': authorId,
      'title': title,
      'coverPhoto': coverPhoto,
      'author': author,
      'synopsis': synopsis,
      'pdffile': pdffile,
    };
  }

  factory BookDetail.fromMap(Map<String, dynamic> map) {
    return BookDetail(
      authorId: map['authorId'],
      title: map['title'],
      coverPhoto: map['coverPhoto'],
      author: map['author'],
      synopsis: map['synopsis'],
      pdffile: map['pdffile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookDetail.fromJson(String source) =>
      BookDetail.fromMap(json.decode(source));
}
