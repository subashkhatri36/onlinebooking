import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/constant/constants.dart';
import 'package:onlinebooks/app/constant/controller.dart';
import 'package:onlinebooks/app/modules/profile/controllers/profile_controller.dart';
import 'package:onlinebooks/app/widgets/height_width.dart';
import 'package:onlinebooks/app/widgets/input/input_widget.dart';
import 'package:onlinebooks/app/widgets/text/normal_widget.dart';

class InsertProfile extends StatefulWidget {
  const InsertProfile({Key? key}) : super(key: key);

  @override
  _InsertProfileState createState() => _InsertProfileState();
}

class _InsertProfileState extends State<InsertProfile> {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightWidget(h: .01),
          SizedBox(
            width: appController.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Obx(
                      () => controller.profileImageSelected.isTrue
                          ? CircleAvatar(
                              radius: Constants.defaultRadius * 3.5,
                              backgroundColor: AppColors.black,
                              child: CircleAvatar(
                                radius: Constants.defaultRadius * 3.4,
                                backgroundColor: AppColors.white,
                                backgroundImage: FileImage(controller.profile!),
                              ),
                            )
                          : controller.profileData!.profile.isNotEmpty
                              ? CircleAvatar(
                                  radius: Constants.defaultRadius * 3.5,
                                  backgroundColor: AppColors.black,
                                  child: CircleAvatar(
                                      radius: Constants.defaultRadius * 3.4,
                                      backgroundColor: AppColors.white,
                                      backgroundImage: NetworkImage(
                                          controller.profileData!.profile)),
                                )
                              : const CircleAvatar(
                                  radius: Constants.defaultRadius * 3.5,
                                  backgroundColor: AppColors.black,
                                  child: CircleAvatar(
                                    radius: Constants.defaultRadius * 3.4,
                                    backgroundColor: AppColors.white,
                                    child: Icon(
                                      Icons.account_circle,
                                      color: AppColors.black,
                                      size: Constants.defaultMargin * 5,
                                    ),
                                  ),
                                ),
                    ),
                    Positioned(
                        bottom: 15,
                        right: 0,
                        child: InkWell(
                            onTap: () {
                              controller.pickCoverPhoto();
                            },
                            child: const CircleAvatar(
                                backgroundColor: AppColors.blue,
                                child: Icon(
                                  Icons.camera,
                                  color: AppColors.white,
                                ))))
                  ],
                ),
                const HeightWidget(h: .02),
                SizedBox(
                    width: appController.width,
                    child: InputField(
                      controller: controller.username,
                      hintText: controller.profileData!.name.isNotEmpty
                          ? controller.profileData!.name
                          : '',
                    )),
                const HeightWidget(h: .02),
              ],
            ),
          ),

          //about
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: NormalText(
              "About",
              isBold: true,
              color: AppColors.grey,
              fontSize: Constants.defaultFontSize + 5,
            ),
          ),
          InputField(
            controller: controller.about,
            hintText: controller.profileData!.about.isNotEmpty
                ? controller.profileData!.about
                : 'Write something about yourself?',
            maxline: 7,
            maxlength: 1000,
          )
        ],
      ),
    );
  }
}
