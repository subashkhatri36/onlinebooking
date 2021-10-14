import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/core/service/storage_service/shared_preference.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/profileData_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:onlinebooks/app/routes/app_pages.dart';

ProfileAPI profileAPI = ProfileAPI();

///it call all user related work
class ProfileAPI {
  Future<ApiCall> updateProfile(
      {required String name,
      required String about,
      required String profile}) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final headers = {
      "token": appController.accesstoken,
      "Connection": "Keep-Alive",
      "Content-Type": "multipart/form-data",
    };

    try {
      var uri = Uri.parse(Api.updateProfile);
      // create multipart request
      var request = http.MultipartRequest("POST", uri);

      request.files.add(http.MultipartFile('profile_pic',
          File(profile).readAsBytes().asStream(), File(profile).lengthSync(),
          contentType: MediaType('image', 'jpeg'),
          filename: profile.split("/").last));

      //add headers
      request.headers.addAll(headers);
      request.fields['name'] = name;
      request.fields['about'] = about;

      var response = await request.send();
      userapi.response = response;
      return userapi;
    } catch (e) {
      userapi.status = false;

      userapi.message = e.toString();
    }
    return userapi;
  }

  Future<ApiCall> loadProfile() async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final header = {
      "token": appController.accesstoken,
      "Connection": "Keep-Alive"
    };
    final body = {};

    try {
      final response = await http.post(
        Uri.parse(Api.profileData),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        var jsonResponse = await json.decode(response.body);

        ProfileData? profileData;

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          userapi.status = true;

          String name = jsonResponse["data"]["name"];
          String about = jsonResponse["data"]["about"];
          String profile = jsonResponse["data"]["profile_pic"];

          List<BookDetailInfo> bookdetailInfo = [];
          for (var book in jsonResponse["data"]["bookList"]) {
            BookDetailInfo bd = BookDetailInfo(
              id: int.parse(book["id"].toString()),
              author: book["author"].toString(),
              title: book["title"].toString(),
              coverPhoto: book["cover_photo"].toString(),
              synopsis: book["synopsis"].toString(),
            );
            bookdetailInfo.add(bd);
          }

          profileData = ProfileData(
              name: name,
              about: about,
              profile: profile,
              booklist: bookdetailInfo);

          userapi.response = profileData;
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
