import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/core/service/storage_service/shared_preference.dart';
import 'package:onlinebooks/app/data/model/home_model.dart';
import 'package:onlinebooks/app/data/model/profileData_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/home_api.dart';
import 'package:onlinebooks/app/data/repositories/login_api_call.dart';
import 'package:onlinebooks/app/data/repositories/profile_data.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String homeTitle = Strings.appName;
  //loading data
  RxBool isloadingdata = false.obs;
  // RxList<CategoryList> categoryList =
  //     List<CategoryList>.empty(growable: true).obs;
  RxList<Home> homeList = List<Home>.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
    gettingHomeData();
    loadProfile();
  }

  logout() async {
    bool val = await userlogin.logout(appController.accesstoken);

    if (val) {
      //logout
      await shareprefrence.remove(Strings.logintoken);
      await shareprefrence.remove(Strings.userInfo);
      Get.offAllNamed(Routes.login);
    }
  }

  //getting home data from api
  gettingHomeData() async {
    isloadingdata.toggle();

    ApiCall apiCall = await homeApi.home();
    if (apiCall.status) {
      List<Home> listHome = [];
      appController.categoryList = apiCall.response[1];
      listHome.add(Home(
          bookdetail: apiCall.response[0],
          categorylist: apiCall.response[1],
          search: apiCall.response[2].toString().toLowerCase() == "true"
              ? true
              : false));
      homeList = listHome.obs;
      // Future.delayed(Duration(seconds: 100));
    } else {
      customSnackbar(title: "Error", message: apiCall.message);
    }

    isloadingdata.toggle();
  }

  ProfileData? profileData;
  void loadProfile() async {
    ApiCall response = await profileAPI.loadProfile();
    if (response.status) {
      profileData = response.response;
    } else {
      customSnackbar(message: response.message);
    }
  }

  @override
  void onClose() {}
}
