import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/data/model/author_model.dart';
import 'package:onlinebooks/app/data/model/book_detail_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/book_upload.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class BookdecriptionController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  RxBool isloadingBook = false.obs;
  RxBool isbookmarked = true.obs;
  RxBool isAuthorLoad = true.obs;
  String bookId = "";
  BookDetail? bookDetail;
  Author? author;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  loadBookDetails(int id) async {
    isloadingBook.toggle();
    bookId = id.toString();
    ApiCall apiCall = await bookUploadAPI.loadBookDetails(bookId);
    if (apiCall.status) {
      // String authoriId = apiCall.response.authorId;

      bookDetail = BookDetail(
          authorId: apiCall.response.authorId,
          title: apiCall.response.title,
          coverPhoto: apiCall.response.coverPhoto,
          author: apiCall.response.author,
          synopsis: apiCall.response.synopsis,
          pdffile: apiCall.response.pdffile,
          bookmark: apiCall.response.bookmark,
          status: apiCall.response.status);
      isbookmarked.value = apiCall.response.bookmark;

      //getting author too// apiCall.response;

    } else {
      customSnackbar(message: apiCall.message);
    }

    isloadingBook.toggle();
  }

  bookmarks() async {
    if (isbookmarked.value) {
      //remove
      ApiCall api = await bookUploadAPI.removeBookmark(bookId);
      if (api.status) {
        api.response = "";
        isbookmarked.value = !isbookmarked.value;
      }
    } else {
      ApiCall api = await bookUploadAPI.addBookmark(bookId);
      if (api.status) {
        api.response = "";
        isbookmarked.value = !isbookmarked.value;
      }
      //add
    }
  }

  loadAuthorInfo() async {
    isAuthorLoad.toggle();
    ApiCall authorcall = await bookUploadAPI.aboutAuthor(bookDetail!.authorId);

    if (authorcall.status) {
      author = Author(
          about: authorcall.response.about,
          name: authorcall.response.name,
          profilePic: authorcall.response.profilePic);
    } else {
      customSnackbar(message: authorcall.message);
    }
    isAuthorLoad.toggle();
  }

  @override
  void onClose() {}
}
