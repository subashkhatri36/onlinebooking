import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/category_list.dart';

class Home {
  final List<BookDetail> bookdetail;
  final List<CategoryList> categorylist;
  bool search;
  Home({
    required this.bookdetail,
    required this.categorylist,
    required this.search,
  });
}
