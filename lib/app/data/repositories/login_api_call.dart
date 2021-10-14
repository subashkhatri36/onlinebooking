import 'dart:convert';
import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:onlinebooks/app/data/model/user.dart';

LoginAPI userlogin = LoginAPI();

///it call all user related work
class LoginAPI {
  Future<bool> logout(String token) async {
    final headers = {'token': token};
    bool value = false;
    try {
      final response = await http.post(
        Uri.parse(Api.logout),
        body: {},
        headers: headers,
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          value = true;
        } else {
          value = false;
        }
      } else {
        value = false;
      }
    } catch (e) {
      value = false;
    }
    return value;
  }

  Future<ApiCall> login(String email, String password) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await http.post(
        Uri.parse(Api.login),
        body: data,
        headers: {},
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body); //["message"].toString();

        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          userapi.status = true;

          String id = jsonResponse["data"]["id"].toString();
          String name = jsonResponse["data"]["name"].toString();
          String status = jsonResponse["data"]["status"].toString();
          String lastlogin = jsonResponse["data"]["last_login_time"].toString();
          String lastloginIp = jsonResponse["data"]["last_login_ip"].toString();
          String token = jsonResponse["data"]["token"].toString();
          appController.accesstoken = token;
          appController.user = User(
              id: int.parse(id),
              name: name,
              status: status == "1" ? true : false,
              lastlogin:
                  DateTime.fromMicrosecondsSinceEpoch(int.parse(lastlogin)),
              loginIp: lastloginIp,
              token: token);
        } else {
          userapi.status = false;
          userapi.message = jsonResponse["message"].toString();
        }

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

  Future<ApiCall> forgetPassword(
    String email,
  ) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final data = {
      'email': email,
    };
    final response = await http.post(
      Uri.parse(Api.forgetPassword),
      body: data,
      headers: {},
    );
    try {
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body); //["message"].toString();
        print(jsonResponse);
        String val = jsonResponse["status"].toString();
        if (val.toLowerCase() == 'true') {
          userapi.status = true;
        } else {
          userapi.status = false;
          userapi.message = jsonResponse["message"].toString();
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

  Future<ApiCall> registration(
      {required String email,
      required String name,
      required String password,
      required String conformpassword}) async {
    ApiCall userapi = ApiCall(message: '', status: false);
    final data = {
      'name': name,
      'username': email,
      'password': password,
      'confirmpassword': conformpassword,
    };

    try {
      final response = await http.post(
        Uri.parse(Api.register),
        body: data,
        headers: {},
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
