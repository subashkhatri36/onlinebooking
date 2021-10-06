import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/themes.dart';

void customSnackbar(
        {String? title,
        required String message,
        IconData? leadingIcon,
        SnackPosition? snackPosition,
        Color? backgroundColor}) =>
    Get.showSnackbar(
      GetBar(
        onTap: (value) {
          Get.back();
        },
        snackPosition: snackPosition ?? SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 3000),
        title: title,
        message: message,
        animationDuration: const Duration(milliseconds: 1000),
        isDismissible: true,
        shouldIconPulse: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        icon: Icon(leadingIcon ?? Icons.info_outline, color: Themes.white),
        backgroundColor: backgroundColor ?? Themes.grey,
      ),
    );
