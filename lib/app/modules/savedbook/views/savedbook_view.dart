import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/modules/booklist/widgets/book_list_widget.dart';
import 'package:onlinebooks/app/widgets/appbar.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/loading_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/savedbook_controller.dart';

class SavedbookView extends GetView<SavedbookController> {
  const SavedbookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      Scaffold(
          appBar: appBarWidget(
            appTitle: 'My Saved Book',
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => controller.isloading.value
                  ? const LoadingWidget()
                  : controller.bookSaveList.isEmpty
                      ? const Center(
                          child: NormalText("NO DATA"),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: controller.bookSaveList.length,
                          itemBuilder: (context, index) {
                            BookDetailInfo bm = controller.bookSaveList[index];
                            // BookDetailInfo(
                            //     id: 1,
                            //     title: "title",
                            //     author: "author",
                            //     coverPhoto: "",
                            //     synopsis: "synopsis");
                            return Stack(
                              children: [
                                BookListItems(
                                  e: bm,
                                  index: index,
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        controller.removeBookMark(bm.id, index);
                                      },
                                      child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: AppColors.red,
                                          child: Icon(
                                            Icons.close,
                                            color: AppColors.white,
                                          )),
                                    ))
                              ],
                            );
                          }),
            ),
          )),
    );
  }
}
