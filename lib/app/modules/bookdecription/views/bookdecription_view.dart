import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/controller.dart';

import '../controllers/bookdecription_controller.dart';

class BookdecriptionView extends GetView<BookdecriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_backspace)),
                Center(
                    child: Image.asset(
                  "assets/image/booklogo.png",
                  height: appController.height * .2,
                  width: appController.width * .2,
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_backspace)),
              ],
            ),
            Center(
              child: Text(
                'BookdecriptionView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
