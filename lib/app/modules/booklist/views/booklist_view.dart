import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/modules/booklist/widgets/book_list_widget.dart';
import 'package:onlinebooks/app/widgets/ad_mob_widget.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/booklist_controller.dart';

class BooklistView extends GetView<BooklistController> {
  final argument = Get.arguments;
  BooklistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String id = argument[1].toString();
    controller.loadCategoryBookList(id: id);
    return authorizedAccess(
      Scaffold(
        appBar: AppBar(
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
            'Category: ${argument[0]}',
            color: AppColors.black,
            isBold: true,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.white,
        ),
        body: Obx(
          () => controller.isloadingBook.value
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    NormalText("Loading Books..."),
                    HeightWidget(h: .02),
                    CircularProgressIndicator()
                  ],
                ))
              : controller.bookdetailList.isEmpty
                  ? const Center(child: NormalText("No Books"))
                  : Column(
                      children: [
                        Expanded(
                          child: BookListWidget(
                            booklistmodel: controller.bookdetailList,
                          ),
                        ),
                        const AdmobBannerAdWidget(),
                      ],
                    ),
        ),
      ),
    );
  }
}
