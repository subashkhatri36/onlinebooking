import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/modules/booklist/widgets/book_list_widget.dart';
import 'package:onlinebooks/app/widgets/appbar.dart';

import '../controllers/savedbook_controller.dart';

class SavedbookView extends GetView<SavedbookController> {
  const SavedbookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
          appTitle: 'My Saved Book',
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                BookDetailInfo bm = BookDetailInfo(
                    id: 1,
                    title: "title",
                    author: "author",
                    coverPhoto: "",
                    synopsis: "synopsis");
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
                          onTap: () {},
                          child: const CircleAvatar(
                              backgroundColor: AppColors.red,
                              child: Icon(Icons.close)),
                        ))
                  ],
                );
              }),
        ));
  }
}
