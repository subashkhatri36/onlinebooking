// import 'package:onlinebooks/app/constant/api_link.dart';
// import 'package:onlinebooks/app/constant/controller.dart';
// import 'package:onlinebooks/app/core/service/http/http_service.dart';
// import 'package:onlinebooks/app/data/model/response_model.dart';

// UserAPI userlogin = UserAPI();

// ///it call all user related work
// class UserAPI {
//   HttpService httpService = HttpServiceImpl();
//   UserAPI() {
//     httpService.init();
//   }

//   Future<ApiCall> userDataFetch() async {
//     ApiCall userapi = ApiCall();
//     final data = {
//       'token': appController.accesstoken,
//     };
//     try {
//       final response = await httpService.post(Api.login, data: data);
//       if (response != null) {
//         userapi.response = response.data;
//         if (userapi.response == null) {
//           userapi.iserror = true;
//           userapi.error = response.data["message"];
//         }
//       }
//     } catch (e) {
//       userapi.iserror = true;
//       userapi.error = e.toString();
//     }
//     return userapi;
//   }
// }
