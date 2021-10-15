import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/core/service/storage_service/shared_preference.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/login_api_call.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class AuthenticationController extends GetxController {
//for register page
  final TextEditingController forgetemail = TextEditingController();

  RxBool islogining = false.obs;

  void login(String username, String password) async {
    islogining.toggle();

    //do what we want to do
    //call api
    final ApiCall response = await userlogin.login(username, password);
    if (response.status) {
      appController.authorized = true;
      Get.offAllNamed(Routes.home);
    } else {
      customSnackbar(
          message: response.message,
          snackPosition: SnackPosition.TOP,
          leadingIcon: Icons.warning);
    }

    islogining.toggle();
  }

  void registration(
      String username, String name, String pass, String repass) async {
    //do what we want to do
    //call api
    final ApiCall response = await userlogin.registration(
        email: username, name: name, password: pass, conformpassword: repass);
    if (response.status) {
      Get.offAllNamed(Routes.login);
    } else {
      customSnackbar(
          message: response.message,
          snackPosition: SnackPosition.TOP,
          leadingIcon: Icons.warning);
    }
  }

  RxBool forgetpassword = false.obs;
  RxBool forget = false.obs;
  void forgetPassword() async {
    forget.toggle();

    if (forgetemail.text.isNotEmpty) {
      //do what we want to do
      //call api
      ApiCall response = await userlogin.forgetPassword(forgetemail.text);
      if (response.status) {
        forgetpassword.value = true;
      } else {
        customSnackbar(
            message: response.message,
            snackPosition: SnackPosition.TOP,
            leadingIcon: Icons.warning,
            backgroundColor: AppColors.red);
      }
    } else {
      //custome snackbar
      customSnackbar(
          message: 'Email is not valid !',
          snackPosition: SnackPosition.TOP,
          leadingIcon: Icons.warning);
    }
    forget.toggle();
  }

  @override
  void onClose() {
    // registrationformkey.currentWidget.di();
    // formkey.dispose();
  }
}
