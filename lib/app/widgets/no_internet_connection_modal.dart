import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetConnectionModal {
  NoInternetConnectionModal() {
    Get.dialog(
      AlertDialog(
        title: const Text('No Internet Connection!'),
        content: SizedBox(
          height: 90.0,
          child: Column(
            children: const [
              Icon(
                Icons.wifi_off_outlined,
                size: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Please make sure you are connected to the internet and its working.'),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}