import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/book_detail.dart';
import 'package:onlinebooks/app/data/model/category_list.dart';
import 'package:onlinebooks/app/data/repositories/home_api.dart';
import 'package:onlinebooks/app/modules/home/widgets/drawer.dart';
import 'package:onlinebooks/app/modules/home/widgets/tranding_list_item_widget.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/clipper/header_clip_path.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/text/header_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.gettingHomeData();
    return authorizedAccess(WillPopScope(
      onWillPop: () async {
        final data = await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Warning !"),
            content: const Text("Do you Want to exit application ?"),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      label: 'Yes'),
                  CustomButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      label: 'No')
                ],
              )
            ],
          ),
        );
        return data;
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: const MainDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: appController.width,
                height: appController.height * .08,
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.defaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.scaffoldKey.currentState!.isDrawerOpen) {
                          controller.scaffoldKey.currentState!.openEndDrawer();
                        } else {
                          controller.scaffoldKey.currentState!.openDrawer();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.sort),
                      ),
                    ),
                    Expanded(
                      child: NormalText(controller.homeTitle,
                          isBold: true,
                          fontSize: Constants.defaultFontSize + 5),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.search)),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.black.withOpacity(.10),
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(
                                AppImage.appLogo,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.orangeColor,
                              child: const NormalText('1',
                                  color: AppColors.white,
                                  fontSize: Constants.defaultFontSize - 5),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.defaultPadding / 1.3),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const HeaderTitle(
                          headerText: 'Tranding',
                        ),
                        SizedBox(
                            width: appController.width,
                            height: appController.height * .35,
                            child: Obx(
                              () => controller.isloadingdata.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : controller.homeList.isEmpty
                                      ? const Center(
                                          child: NormalText("No Books"),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .homeList[0].bookdetail.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            BookDetailInfo b = controller
                                                .homeList[0].bookdetail[index];

                                            return InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.bookdescription,
                                                    arguments: b.id);
                                              },
                                              child: TrandingListItems(
                                                bookImage: b.coverPhoto,
                                                bookname: b.title,
                                                authorname: b.author,
                                                backgroundColor:
                                                    AppColors.list1color,
                                              ),
                                            );
                                          }),
                            )),
                        const HeightWidget(h: .02),
                        const HeaderTitle(
                          headerText: 'Categories',
                        ),
                        SizedBox(
                            width: appController.width,
                            height: appController.height * .35,
                            child: Obx(
                              () => controller.isloadingdata.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : controller.homeList.isEmpty
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: 4 / 1,
                                          crossAxisSpacing: 3,
                                          mainAxisSpacing: 6,
                                          //physics:NeverScroll(),
                                          // padding: EdgeInsets.all(10.0),
                                          children: controller
                                              .homeList[0].categorylist
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes.booklist);
                                                    },
                                                    child: CategoryItemList(
                                                      e: e,
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class CategoryItemList extends StatelessWidget {
  const CategoryItemList({Key? key, required this.e}) : super(key: key);
  final CategoryList e;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              horizontal: Constants.defaultMargin / 2),
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding,
              vertical: Constants.defaultPadding / 4),
          decoration: BoxDecoration(
              color: AppColors.categoryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Image.network(
                e.image,
                fit: BoxFit.fitHeight,
                height: Constants.defaultMargin * 1.5,
              ),
              const SizedBox(
                width: 5,
              ),
              NormalText(
                e.name,
                isBold: true,
                isCentered: true,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.headerText,
    this.textcolor = AppColors.black,
    this.logoColor = AppColors.grey,
  }) : super(key: key);
  final String headerText;
  final Color textcolor;
  final Color logoColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: appController.width,
        height: appController.height * .05,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.yellow,
                child: ClipPath(
                  clipper: HeaderClipper(),
                  child: const SizedBox(
                    height: Constants.defaultMargin * 2,
                    width: Constants.defaultMargin * 2,
                  ),
                ),
              ),
            ),
            HeaderText(
              headerText,
              textColor: textcolor,
            ),
          ],
        ));
  }
}
