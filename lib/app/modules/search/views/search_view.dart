import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/modules/booklist/widgets/book_list_widget.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/input/input_widget.dart';
import 'package:onlinebooks/app/widgets/loading_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const HeightWidget(h: .005),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.keyboard_backspace)),
                    Expanded(
                      flex: 8,
                      child: InputField(
                        hintText: "Search Here",
                        borderRadius: Constants.defaultRadius,
                        controller: controller.searchtext,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: CustomButton(
                          label: 'Search',
                          onPressed: () {
                            controller.searchBox();
                          },
                          backgroundColor: Colors.green,
                          textColor: AppColors.white,
                        ))
                  ],
                ),
                const HeightWidget(h: .01),
                Expanded(
                    child: Obx(
                  () => controller.isloadingdata.isTrue
                      ? const LoadingWidget()
                      : controller.homeList == null
                          ? const NormalText(
                              "No Data",
                              isBold: true,
                            )
                          : controller.homeList!.bookdetail.isEmpty
                              ? const NormalText(
                                  "No Data",
                                  isBold: true,
                                )
                              : BookListWidget(
                                  booklistmodel:
                                      controller.homeList!.bookdetail,
                                ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
