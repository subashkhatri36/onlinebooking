import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/modules/booklist/widgets/book_list_widget.dart';
import 'package:onlinebooks/app/modules/profile/widgets/insert_update_profile_widget.dart';
import 'package:onlinebooks/app/routes/app_pages.dart';
import 'package:onlinebooks/app/widgets/button/button_widget.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.uploadbooks);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isDataLoaded.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      NormalText("Loading Profile.."),
                      HeightWidget(h: .02),
                      CircularProgressIndicator()
                    ],
                  ),
                )
              : controller.profileData == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NormalText(controller.nodata),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(Icons.keyboard_backspace),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.isEditing.value = true;
                                },
                                child: const NormalText("Edit"),
                              )
                            ],
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Obx(
                                  () => !controller.isEditing.value
                                      ? const ProfileInfoDisplay()
                                      : const InsertProfile(),
                                ),
                                const HeightWidget(h: .01),
                                Obx(
                                  () => controller.isEditing.value
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right:
                                                    Constants.defaultPadding),
                                            child: Obx(
                                              () => controller.isupdating.isTrue
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : CustomButton(
                                                      textColor:
                                                          AppColors.white,
                                                      backgroundColor:
                                                          AppColors.orangeColor,
                                                      label: "Saved",
                                                      onPressed: () {
                                                        controller
                                                            .saveProfile();
                                                      }),
                                            ),
                                          ))
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const NormalText(
                                              "About",
                                              color: AppColors.grey,
                                              fontSize:
                                                  Constants.defaultFontSize + 5,
                                              isBold: true,
                                            ),
                                            const HeightWidget(h: .01),
                                            controller.profileData!.about
                                                    .isNotEmpty
                                                ? NormalText(
                                                    controller
                                                        .profileData!.about,
                                                    isBold: true,
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                ),
                                const HeightWidget(h: .02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const NormalText(
                                      "My Book",
                                      color: AppColors.grey,
                                      fontSize: Constants.defaultFontSize + 5,
                                      isBold: true,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.loadProfile();
                                        },
                                        icon: const Icon(Icons.refresh)),
                                  ],
                                ),
                                const HeightWidget(h: .01),
                                BookListWidget(
                                    booklistmodel:
                                        controller.profileData!.booklist),
                              ],
                            ),
                          ))
                        ],
                      )),
        ),
      ),
    );
  }
}

class ProfileInfoDisplay extends StatelessWidget {
  const ProfileInfoDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return SizedBox(
      width: appController.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.profileData!.profile.isEmpty
              ? const CircleAvatar(
                  radius: Constants.defaultRadius * 3,
                  backgroundImage: AssetImage(AppImage.appLogo))
              : CircleAvatar(
                  radius: Constants.defaultRadius * 3,
                  backgroundImage:
                      NetworkImage(controller.profileData!.profile)),
          const HeightWidget(h: .02),
          NormalText(
            controller.profileData!.name,
            isBold: true,
            isCentered: true,
          )
        ],
      ),
    );
  }
}
