import 'package:get/get.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/book_upload.dart';
import 'package:onlinebooks/app/data/repositories/saved_book.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class SavedbookController extends GetxController {
  RxBool isloading = false.obs;
  RxList<BookDetailInfo> bookSaveList =
      List<BookDetailInfo>.empty(growable: true).obs;

  @override
  void onInit() {
    loadSavedBook();
    super.onInit();
  }

  @override
  void onClose() {}

  void loadSavedBook() async {
    isloading.toggle();
    ApiCall api = await bookMarkAPI.loadBookmark();
    if (api.status) {
      List<BookDetailInfo> book = [];
      book = api.response;
      bookSaveList = book.obs;
    } else {
      customSnackbar(message: api.message);
    }
    isloading.toggle();
  }

  removeBookMark(int id, int index) async {
    ApiCall api = await bookUploadAPI.removeBookmark(id.toString());
    if (api.status) {
      bookSaveList.removeAt(index);
    } else {
      customSnackbar(message: api.message);
    }
  }
}
