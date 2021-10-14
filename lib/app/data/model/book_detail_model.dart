import 'dart:convert';

class BookDetail {
  final String authorId;
  final String title;
  final String coverPhoto;
  final String author;
  final String synopsis;
  final String pdffile;
  final bool status;
  final bool bookmark;

  BookDetail({
    required this.authorId,
    required this.title,
    required this.coverPhoto,
    required this.author,
    required this.synopsis,
    required this.pdffile,
    required this.status,
    required this.bookmark,
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
}
