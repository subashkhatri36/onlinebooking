import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/data/model/category_list.dart';
import 'package:onlinebooks/app/modules/home/widgets/category_items.dart';
import 'package:onlinebooks/app/utls/validation.dart';
import 'package:onlinebooks/app/widgets/authorized_widet_only.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/input/input_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/uploadbooks_controller.dart';

class UploadbooksView extends GetView<UploadbooksController> {
  const UploadbooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.keyboard_backspace_rounded,
                color: AppColors.black),
          ),
          backgroundColor: AppColors.white,
          title: const NormalText(
            'Upload Yours Book',
            isBold: true,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(Constants.defaultPadding / 2),
          child: Form(
            key: controller.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightWidget(h: .02),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NormalText(
                        "Select Category",
                        isBold: true,
                      ),
                      const HeightWidget(h: .02),
                      SizedBox(
                        height: appController.height * .05,
                        width: appController.width,
                        child: appController.categoryList.isEmpty
                            ? Container()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: appController.categoryList.length,
                                itemBuilder: (context, index) {
                                  CategoryList e =
                                      appController.categoryList[index];
                                  if (index == 0) {
                                    controller.categoryId = e.id.toString();
                                  }
                                  return Obx(
                                    () => controller.changeIndex.value == index
                                        ? InkWell(
                                            onTap: () {
                                              controller.changeIndex.value =
                                                  index;
                                              controller.categoryId =
                                                  e.id.toString();
                                            },
                                            child: CategoryItemList(
                                              e: e,
                                              bgcolor: AppColors.grey,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              controller.changeIndex.value =
                                                  index;
                                              controller.categoryId =
                                                  e.id.toString();
                                            },
                                            child: CategoryItemList(
                                              e: e,
                                            ),
                                          ),
                                  );
                                }),
                      ),
                      const HeightWidget(h: .02),
                      const Padding(
                          padding: EdgeInsets.all(Constants.defaultPadding / 2),
                          child: NormalText(
                            "Book Title :",
                            isBold: true,
                          )),
                      InputField(
                        controller: controller.bookname,
                        hintText: "Write your book title here",
                        validator: (value) => validateIsEmpty(string: value),
                      ),
                      const HeightWidget(h: .01),
                      const Padding(
                          padding: EdgeInsets.all(Constants.defaultPadding / 2),
                          child: NormalText(
                            "Synopsis :",
                            isBold: true,
                          )),
                      InputField(
                        controller: controller.synposis,
                        hintText: "Synopsis here",
                        maxlength: 1000,
                        maxline: 15,
                        validator: (value) => validateIsEmpty(string: value),
                      ),
                      Row(
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.all(Constants.defaultPadding / 2),
                              child: NormalText(
                                "Upload book Cover :",
                                isBold: true,
                              )),
                          IconButton(
                              onPressed: () {
                                controller.pickCoverPhoto();
                              },
                              icon: const Icon(
                                Icons.cloud_upload,
                                color: AppColors.blue,
                              ))
                        ],
                      ),
                      Obx(() => !controller.selectCover.value
                          ? Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: appController.height * .2,
                                width: appController.width * .3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.grey,
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: appController.height * .2,
                              width: appController.width,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: appController.height * .2,
                                    width: appController.width * .3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        File(controller.coverFile!.path),
                                        fit: BoxFit.fill,
                                        height: appController.height * .2,
                                        width: appController.width * .3,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: appController.width * .2,
                                      child: IconButton(
                                          onPressed: () {
                                            controller.removeCover();
                                          },
                                          icon:
                                              const Icon(Icons.close_rounded)))
                                ],
                              ),
                            )),
                      const HeightWidget(h: .03),
                      Row(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.all(Constants.defaultPadding / 2),
                            child: NormalText(
                              "Upload book :",
                              isBold: true,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.pickPdfFile();
                              },
                              icon: const Icon(
                                Icons.cloud_upload,
                                color: AppColors.blue,
                              ))
                        ],
                      ),
                      Obx(() => !controller.selectfile.value
                          ? Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: appController.height * .07,
                                  width: appController.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child:
                                      const NormalText("Pdf format supported")),
                            )
                          : Stack(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    height: appController.height * .1,
                                    width: appController.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: NormalText(controller.filename)),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () {
                                          controller.removeFile();
                                        },
                                        icon: const Icon(Icons.close)))
                              ],
                            )),
                    ],
                  ),
                )),

                //button
                Center(
                  child: Obx(
                    () => controller.uploadingBooks.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: appController.width * .4,
                            child: CustomButton(
                                textColor: AppColors.white,
                                backgroundColor: AppColors.orangeColor,
                                label: "Done",
                                onPressed: () {
                                  controller.uploadBookData();
                                }),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
