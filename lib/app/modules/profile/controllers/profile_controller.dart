import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/app_color.dart';
import 'package:onlinebooks/app/data/model/profileData_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/profile_data.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class ProfileController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController about = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String nodata = "No Data Found!";
  RxBool isEditing = false.obs;
  ProfileData? profileData;
  RxBool isDataLoaded = false.obs;
  RxBool isupdating = false.obs;

  String profileImage = '';
  File? profile;
  RxBool profileImageSelected = false.obs;

  removePhoto() {
    profileImageSelected.value = false;
    profileImage = "";
    profile = null;
  }

  pickCoverPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      profileImage = result.files.single.path!;
      profile = File(result.files.single.path!);
      profileImageSelected.value = true;
    } else {
      // User canceled the picker
      profileImageSelected.value = false;
    }
  }

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  @override
  void onClose() {}

  void saveProfile() async {
    isupdating.toggle();
    if (profileImage.isNotEmpty) {
      if (formkey.currentState!.validate()) {
        ApiCall api = await profileAPI.updateProfile(
            name: username.text, about: about.text, profile: profileImage);

        // listen for response
        api.response.stream.transform(utf8.decoder).listen((value) async {
          if (api.response.statusCode == 200) {
            var jsonResponse = json.decode(value);

            String val = jsonResponse["status"].toString();
            if (val.toLowerCase() == 'true') {
              String name = await jsonResponse["data"]["name"];
              String about = await jsonResponse["data"]["about"];
              String profile = await jsonResponse["data"]["profile_pic"];
              profileData = ProfileData(
                  name: name,
                  about: about,
                  profile: profile,
                  booklist: profileData!.booklist);
              isEditing.value = false;
              customSnackbar(
                  message: "Successfully Updated",
                  backgroundColor: Colors.green);
              // userapi.response = profileData;
            } else {
              customSnackbar(
                  message: jsonResponse["message"].toString(),
                  backgroundColor: AppColors.red);
            }
          } else {
            customSnackbar(
                message: "Bad Connection Error.",
                backgroundColor: AppColors.red);
          }
        });
      }
    } else {
      customSnackbar(
          message: "Please Select Profile Image",
          backgroundColor: AppColors.red);
    }
    isupdating.toggle();
  }

  void loadProfile() async {
    isDataLoaded.toggle();
    ApiCall response = await profileAPI.loadProfile();
    if (response.status) {
      profileData = response.response;
    } else {
      customSnackbar(message: response.message);
    }
    isDataLoaded.toggle();
  }
}
