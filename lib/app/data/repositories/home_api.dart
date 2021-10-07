import 'dart:convert';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;

HomeAPI homeApi = HomeAPI();

///it call all user related work
class HomeAPI {
  Future<ApiCall> home({String searchkeyword = ''}) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final header = {"token": appController.accesstoken};
    final body = {
      'search_keyword': searchkeyword,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.home),
        body: body,
        headers: header,
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          userapi.status = true;
        } else {
          userapi.status = false;
        }
        userapi.message = jsonResponse["message"].toString();

        // return ApiCall.fromMap(jsonResponse);
      } else {
        userapi.status = false;
        userapi.message = "Bad Connection Error.";
      }
    } catch (e) {
      userapi.status = false;
      userapi.message = "Something went wong.";
    }
    return userapi;
  }
}
