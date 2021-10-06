import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  double width = 0.0;
  double height = 0.0;
  String accesstoken = '';
  bool authorized = false;
  RxBool islandscape = false.obs;
  //Core list
  init() async {
    width = MediaQuery.of(Get.context!).size.width;
    height = MediaQuery.of(Get.context!).size.height;
    await loadDatabase();
  }

  Future loadDatabase() async {
    // accesstoken = await shareprefrence.read(Strings.logintoken);
    // if (accesstoken.isNotEmpty) {
    //   authorized = true;
    // } else {
    //   authorized = false;
    // }
    // await loadOfflineDatabase();
  }

  loadOfflineDatabase() async {
    // //print('starting fetching database');
    // shaidDataOffline.value = false;

    // if (offlineShaidModel.isNotEmpty) {
    //   offlineShaidModel.clear();
    // }
    // var shaidDetail = await shareprefrence.read(DBname.shaid);
    // if (shaidDetail.isNotEmpty) {
    //   for (var val in json.decode(shaidDetail)) {
    //     offlineShaidModel.add(CoreShaidModel.fromJson(val));
    //   }
    // }
    // shaidDataOffline.value = true;
  }
}
