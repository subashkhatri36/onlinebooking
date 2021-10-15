import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/loading_widget.dart';
import 'package:onlinebooks/app/widgets/text/header_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/bookdecription_controller.dart';

class BookdecriptionView extends GetView<BookdecriptionController> {
  final bookid = Get.arguments;
  BookdecriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.loadBookDetails(bookid);
    return authorizedAccess(
      Scaffold(
        body: SafeArea(
          child: Obx(
            () => controller.isloadingBook.value
                ? const LoadingWidget()
                : controller.bookDetail == null
                    ? const Center(
                        child: NormalText("No Data Found Try Again."),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(
                                Constants.defaultPadding / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.keyboard_backspace)),
                                Center(
                                    child: Container(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      controller
                                              .bookDetail!.coverPhoto.isNotEmpty
                                          ? controller.bookDetail!.coverPhoto
                                          : "https://images-na.ssl-images-amazon.com/images/I/81dQwQlmAXL.jpg",
                                      height: appController.height * .3,
                                      width: appController.width * .4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                                InkWell(
                                  onTap: () {
                                    controller.bookmarks();
                                  },
                                  child: Obx(
                                    () => controller.isbookmarked.value
                                        ? Icon(
                                            Icons.bookmark,
                                            size: 30,
                                            color: AppColors.orangeColor,
                                          )
                                        : Icon(
                                            Icons.bookmark_border_outlined,
                                            size: 30,
                                            color: AppColors.orangeColor,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: appController.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: Constants.defaultMargin),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HeaderText(
                                  controller.bookDetail!.title,
                                  textColor: AppColors.black,
                                ),
                                const HeightWidget(h: .01),
                                NormalText(
                                  "Author : ${controller.bookDetail!.author}",
                                  color: AppColors.black,
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),
                          //tabcontroller
                          Expanded(
                            child: DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  TabBar(
                                    indicatorWeight: 5.0,
                                    labelColor: Colors.black,
                                    controller: controller.tabController,
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 14),
                                    tabs: const [
                                      Tab(
                                        text: 'Synopsis',
                                      ),
                                      Tab(
                                        text: 'About Author',
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                        controller: controller.tabController,
                                        children: [
                                          SynposisWidget(
                                            data:
                                                controller.bookDetail!.synopsis,
                                          ),
                                          const AuthorWidget()
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: appController.width * .5,
                            child: CustomButton(
                                label: "Read IT",
                                onPressed: () {
                                  Get.toNamed(Routes.bookread, arguments: [
                                    controller.bookDetail!.title,
                                    controller.bookDetail!.pdffile
                                  ]);
                                },
                                textColor: AppColors.white,
                                backgroundColor: AppColors.orangeColor),
                          ),
                          const HeightWidget(h: .01),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookdecriptionController>();
    controller.loadAuthorInfo();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => !controller.isAuthorLoad.value
            ? Center(
                child: Column(
                  children: const [
                    NormalText("Loading Author..."),
                    HeightWidget(h: .02),
                    CircularProgressIndicator()
                  ],
                ),
              )
            : controller.author == null
                ? const Center(
                    child: NormalText("No Author Found"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const HeightWidget(h: .02),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: controller.author!.profilePic.isNotEmpty
                              ? Image.network(controller.author!.profilePic,
                                  height: 100, width: 100, fit: BoxFit.fill)
                              : Image.asset(AppImage.appLogo,
                                  height: 100, width: 100, fit: BoxFit.fill),
                        ),
                        NormalText(
                          controller.author!.name,
                          isBold: true,
                        ),
                        const HeightWidget(h: .01),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NormalText(
                            controller.author!.about,
                            isCentered: true,
                          ),
                        ),
                      ],
                    ),
                  )));
  }
}

class SynposisWidget extends StatelessWidget {
  const SynposisWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NormalText(data),
    );
  }
}
