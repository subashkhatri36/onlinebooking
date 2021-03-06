import 'dart:convert';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/category_list.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;

HomeAPI homeApi = HomeAPI();

///it call all user related work
class HomeAPI {
  Future<ApiCall> home({String searchkeyword = ''}) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final header = {
      "token": appController.accesstoken,
      "Connection": "Keep-Alive"
    };
    final body = {
      'search_keyword': searchkeyword,
    };
    List<BookDetailInfo> bookdetail = [];
    List<CategoryList> categorylist = [];
    try {
      final response = await http.post(
        Uri.parse(Api.home),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          userapi.status = true;

          for (var book in jsonResponse["data"]["bookDetail"]) {
            bookdetail.add(BookDetailInfo(
                id: int.parse(book["id"].toString()),
                title: book["title"].toString(),
                author: book["author"].toString(),
                coverPhoto: book["cover_photo"].toString(),
                synopsis: book["synopsis"].toString()));
          }
          if (searchkeyword.isEmpty) {
            for (var category in jsonResponse["data"]["categoryList"]) {
              categorylist.add(CategoryList(
                  id: int.parse(category["id"].toString()),
                  name: category["name"].toString(),
                  image: category["image"].toString()));
            }
          }

          userapi.response = [
            bookdetail,
            categorylist,
            jsonResponse["search"].toString()
          ];
        } else {
          userapi.status = false;
          userapi.message = jsonResponse["message"].toString();

          // if (userapi.message == "Invalid Token") {
          //   shareprefrence.remove(Strings.logintoken);
          //   shareprefrence.remove(Strings.userInfo);
          //   Get.offAllNamed(Routes.login);
          // }
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
