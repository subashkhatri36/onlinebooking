import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/core/service/storage_service/shared_preference.dart';
import 'package:onlinebooks/app/data/model/user.dart';

class AppController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  String accesstoken = '';
  bool authorized = false;
  RxBool islandscape = false.obs;
  RxBool userInfoData = false.obs;

  User? user;
  //Core list
  init() async {
    width = MediaQuery.of(Get.context!).size.width;
    height = MediaQuery.of(Get.context!).size.height;
    await loadDatabase();
  }

  Future loadDatabase() async {
    accesstoken = await shareprefrence.read(Strings.logintoken);
    if (accesstoken.isNotEmpty) {
      authorized = true;
    } else {
      authorized = false;
    }
    await loadOfflineDatabase();
  }

  loadOfflineDatabase() async {
    userInfoData.value = false;

    if (user != null) {
      user = null;
    }
    var userdetail = await shareprefrence.read(Strings.userInfo);
    if (userdetail.isNotEmpty) {
      user = User.fromJson(json.decode(userdetail));
    }
    userInfoData.value = true;
  }
}
