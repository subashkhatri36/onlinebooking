import 'dart:convert';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/core/service/storage_service/shared_preference.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:onlinebooks/app/routes/app_pages.dart';

BookListAPI bookListAPI = BookListAPI();

///it call all user related work
class BookListAPI {
  Future<ApiCall> loadBookList({String categoryId = ''}) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final header = {
      "token": appController.accesstoken,
      "Connection": "Keep-Alive"
    };
    final body = {
      'category_id': categoryId,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.bookList),
        body: body,
        headers: header,
      );

      List<BookDetailInfo> booklist = [];
      if (response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          userapi.status = true;
          for (var book in jsonResponse["data"]["bookList"]) {
            BookDetailInfo bi = BookDetailInfo(
                id: int.parse(book["id"].toString()),
                title: book["title"].toString(),
                author: book["author"].toString(),
                coverPhoto: book["cover_photo"].toString(),
                synopsis: book["synopsis"].toString());
            booklist.add(bi);
          }
          userapi.response = booklist;

          // for (var book in jsonResponse["data"]["bookDetail"]) {}
        } else {
          userapi.status = false;
          userapi.message = jsonResponse["message"].toString();
          if (userapi.message == "Invalid Token") {
            shareprefrence.remove(Strings.logintoken);
            shareprefrence.remove(Strings.userInfo);
            Get.offAllNamed(Routes.login);
          }
        }

        // return ApiCall.fromMap(jsonResponse);
      } else {
        userapi.status = false;
        userapi.message = "Bad Connection Error.";
      }
    } catch (e) {
      userapi.status = false;
      userapi.message = e.toString();
    }
    return userapi;
  }
}
