import 'dart:async';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';

class SplashController extends GetxController {
  String loading = 'loading';

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async {
    await appController.init();
    //  print(appController.accesstoken);
    if (appController.accesstoken.isNotEmpty) {
      Get.offNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  @override
  void onClose() {}
}
