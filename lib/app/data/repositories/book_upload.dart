import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/author_model.dart';
import 'package:onlinebooks/app/data/model/book_detail_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;

BookAPI bookUploadAPI = BookAPI();

///it call all user related work
class BookAPI {
  Future<ApiCall> removeBookmark(String bookId) async {
    ApiCall bookapi = ApiCall(message: '', status: false);
    try {
      final headers = {
        "token": appController.accesstoken,
      };

      final response = await http.post(
        Uri.parse(Api.bookmark),
        body: {"book_id": bookId, "action": "2"},
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse =
            await json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          bookapi.status = true;
          bookapi.response = '';
        } else {
          bookapi.status = false;
          bookapi.message = jsonResponse["message"].toString();
        }

        // return ApiCall.fromMap(jsonResponse);
      } else {
        bookapi.status = false;
        bookapi.message = "Bad Connection Error.";
      }
    } catch (e) {
      bookapi.status = false;
      bookapi.message = "Something went wong.";
    }
    return bookapi;
  }

  Future<ApiCall> addBookmark(String bookId) async {
    ApiCall bookapi = ApiCall(message: '', status: false);
    try {
      final headers = {
        "token": appController.accesstoken,
      };

      final response = await http.post(
        Uri.parse(Api.bookmark),
        body: {"book_id": bookId, "action": "1"},
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse =
            await json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          bookapi.status = true;
          bookapi.response = '';
          // bookapi.response = books;
        } else {
          bookapi.status = false;
          bookapi.message = jsonResponse["message"].toString();
        }

        // return ApiCall.fromMap(jsonResponse);
      } else {
        bookapi.status = false;
        bookapi.message = "Bad Connection Error.";
      }
    } catch (e) {
      bookapi.status = false;
      bookapi.message = "Something went wong.";
    }
    return bookapi;
  }

  Future<ApiCall> loadBookDetails(String bookId) async {
    ApiCall bookapi = ApiCall(message: '', status: false);
    try {
      final headers = {
        "token": appController.accesstoken,
      };

      final response = await http.post(
        Uri.parse(Api.bookDetails),
        body: {
          "book_id": bookId,
        },
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse =
            await json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          bookapi.status = true;
          String title =
              jsonResponse["data"]["bookDetails"]["title"].toString();

          String coverPhoto =
              jsonResponse["data"]["bookDetails"]["cover_photo"].toString();
          String author =
              jsonResponse["data"]["bookDetails"]["author"].toString();
          String synopsis =
              jsonResponse["data"]["bookDetails"]["synopsis"].toString();
          String pdffile =
              jsonResponse["data"]["bookDetails"]["pdf_file"].toString();
          String authorId =
              jsonResponse["data"]["bookDetails"]["author_id"].toString();
          bool status =
              jsonResponse["data"]["bookDetails"]["status"].toString() == "1"
                  ? true
                  : false;
          bool bookmark = jsonResponse["data"]["bookDetails"]
                          ["book_mark_status"]
                      .toString() ==
                  "true"
              ? true
              : false;

          BookDetail books = BookDetail(
              authorId: authorId,
              title: title,
              coverPhoto: coverPhoto,
              author: author,
              synopsis: synopsis,
              pdffile: pdffile,
              bookmark: bookmark,
              status: status);
          bookapi.response = books;
        } else {
          bookapi.status = false;
          bookapi.message = jsonResponse["message"].toString();
        }

        // return ApiCall.fromMap(jsonResponse);
      } else {
        bookapi.status = false;
        bookapi.message = "Bad Connection Error.";
      }
    } catch (e) {
      bookapi.status = false;
      bookapi.message = "Something went wong.";
    }
    return bookapi;
  }

  Future<ApiCall> aboutAuthor(String authorId) async {
    ApiCall bookapi = ApiCall(message: '', status: false);
    try {
      final headers = {
        "token": appController.accesstoken,
      };
      final body = {
        "author_id": authorId,
      };

      final response = await http.post(
        Uri.parse(Api.aboutAuthor),
        body: body,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse =
            await json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          bookapi.status = true;

          String name = jsonResponse["data"]["name"].toString();

          String about = jsonResponse["data"]["about"].toString();
          String profile = jsonResponse["data"]["profile_pic"].toString();

          Author author = Author(name: name, about: about, profilePic: profile);

          bookapi.response = author;
        } else {
          bookapi.status = false;
          bookapi.message = jsonResponse["message"].toString();
        }

        // return ApiCall.fromMap(jsonResponse);
      } else {
        bookapi.status = false;
        bookapi.message = "Bad Connection Error.";
      }
    } catch (e) {
      bookapi.status = false;
      bookapi.message = "Something went wong.";
    }
    return bookapi;
  }

  Future<ApiCall> uploadbooks(
      {required String bookname,
      required String categoryId,
      required String synopsis,
      required File bookcover,
      required File bookfile}) async {
    ApiCall userapi = ApiCall(message: '', status: false);

    try {
      var uri = Uri.parse(Api.uploadbook);

      // create multipart request
      var request = http.MultipartRequest("POST", uri);

      final headers = {
        "token": appController.accesstoken,
        "Content-Type": "multipart/form-data",
        "Connection": "Keep-Alive"
      };

      request.files.add(http.MultipartFile(
          'cover_image',
          File(bookcover.path).readAsBytes().asStream(),
          File(bookcover.path).lengthSync(),
          contentType: MediaType('image', 'jpeg'),
          filename: bookcover.path.split("/").last));

      request.files.add(http.MultipartFile(
          'pdf_file',
          File(bookfile.path).readAsBytes().asStream(),
          File(bookfile.path).lengthSync(),
          contentType: MediaType('application', 'pdf'),
          filename: bookfile.path.split("/").last));

      //add headers
      request.headers.addAll(headers);
      request.fields['category_id'] = categoryId;
      request.fields['synopsis'] = synopsis;
      request.fields['title'] = bookname;

      var response = await request.send();

      userapi.response = response;
      return userapi;
    } catch (e) {
      userapi.status = false;
      userapi.message = e.toString();
    }
    return userapi;
  }
}
