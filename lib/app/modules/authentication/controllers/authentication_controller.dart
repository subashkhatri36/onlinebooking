import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/core/service/storage_service/shared_preference.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/login_api_call.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class AuthenticationController extends GetxController {
  //for login page
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  //for register page
  final TextEditingController regusername = TextEditingController();
  final TextEditingController regname = TextEditingController();
  final TextEditingController regpassword = TextEditingController();
  final TextEditingController regconpassword = TextEditingController();
  final GlobalKey<FormState> registrationformkey = GlobalKey<FormState>();
  RxBool islogining = false.obs;

  void login() async {
    islogining.toggle();

    if (formkey.currentState!.validate()) {
      //do what we want to do
      //call api
      final ApiCall response =
          await userlogin.login(username.text, password.text);
      if (response.status) {
        shareprefrence.save(Strings.userInfo, appController.user!.toJson());
        shareprefrence.save(Strings.logintoken, appController.user!.token);

        appController.authorized = true;
        Get.offAllNamed(Routes.home);
      } else {
        customSnackbar(
            message: response.message,
            snackPosition: SnackPosition.TOP,
            leadingIcon: Icons.warning);
      }
    } else {
      //custome snackbar
      customSnackbar(
          message: 'Email or Password not valid !',
          snackPosition: SnackPosition.TOP,
          leadingIcon: Icons.warning);
    }
    islogining.toggle();
  }

  void registration() async {
    if (registrationformkey.currentState!.validate()) {
      //do what we want to do
      //call api
      final ApiCall response = await userlogin.registration(
          email: regusername.text,
          name: regname.text,
          password: regpassword.text,
          conformpassword: regconpassword.text);
      if (response.status) {
        Get.offAllNamed(Routes.login);
      } else {
        customSnackbar(
            message: response.message,
            snackPosition: SnackPosition.TOP,
            leadingIcon: Icons.warning);
      }
    } else {
      //custome snackbar
      customSnackbar(
          message: 'Email or Password not valid !',
          snackPosition: SnackPosition.TOP,
          leadingIcon: Icons.warning);
    }
  }

  /*
   HttpService _httpService = HttpServiceImpl();
  
  //turnOvers
  getGetTopTurnOvers() async {
    List<GetTopTurnovers> data = [];
    final response = await _httpService.post(ApiUrl.topTurnovers,
        data: ApiUrl.gettoptrunoverheader);

    final apiData = response.data['d'];
    if (apiData != null)
      apiData.forEach((e) {
        data.add(GetTopTurnovers.fromJson(e));
      });

    return data;
  }

  
  
   */

  @override
  void onClose() {
    // registrationformkey.currentWidget.di();
    // formkey.dispose();
  }
}
