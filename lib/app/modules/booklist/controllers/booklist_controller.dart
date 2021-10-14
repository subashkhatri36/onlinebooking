import 'package:get/get.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/book_list.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class BooklistController extends GetxController {
  RxBool isloadingBook = false.obs;
  List<BookDetailInfo> bookdetailList = [];

  @override
  void onClose() {}

  void loadCategoryBookList({required String id}) async {
    isloadingBook.toggle();
    ApiCall api = await bookListAPI.loadBookList(categoryId: id);
    if (api.status) {
      bookdetailList = api.response ?? [];
    } else {
      customSnackbar(message: api.message);
    }

    isloadingBook.toggle();
  }
}
