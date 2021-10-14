// ignore_for_file: file_names

import 'package:onlinebooks/app/data/model/book_detail.dart';

class ProfileData {
  final String name;
  final String about;
  final String profile;
  final List<BookDetailInfo> booklist;

  ProfileData({
    required this.name,
    required this.about,
    required this.profile,
    required this.booklist,
  });
}
