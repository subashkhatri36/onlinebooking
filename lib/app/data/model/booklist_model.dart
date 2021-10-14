import 'package:onlinebooks/app/data/model/book_detail.dart';

class BookListModel {
  List<BookDetailInfo> bookdetailInfo;
  final String category;

  BookListModel({
    required this.bookdetailInfo,
    required this.category,
  });
}
