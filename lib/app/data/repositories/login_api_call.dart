import 'package:onlinebooks/app/constant/api_link.dart';
import 'package:onlinebooks/app/core/service/http/http_service.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';

LoginAPI userlogin = LoginAPI();

///it call all user related work
class LoginAPI {
  HttpService httpService = HttpServiceImpl();
  LoginAPI() {
    httpService.init();
  }

  Future<bool> logout(String token) async {
    final data = {'token': token};
    try {
      final response = await httpService.post(Api.logout, data: data);
      //"message": "Successfully logged out"
      if (response != null) {
        if (response.data['message'] == "Successfully logged out") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<ApiCall> login(String email, String password) async {
    ApiCall userapi = ApiCall();
    final data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await httpService.post(Api.login, data: data);
      if (response != null) {
        userapi.response = response.data["access_token"];
        if (userapi.response == null) {
          userapi.iserror = true;
          userapi.error = response.data["message"];
        }
      }
    } catch (e) {
      userapi.iserror = true;
      userapi.error = e.toString();
    }
    return userapi;
  }
}
