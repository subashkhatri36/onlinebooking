import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

PreferredSizeWidget appBarWidget({required String appTitle}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.keyboard_backspace,
        color: AppColors.black,
      ),
    ),
    title: NormalText(
      appTitle,
      color: AppColors.black,
      isBold: true,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.white,
  );
}
