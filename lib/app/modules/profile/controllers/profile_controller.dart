import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  RxBool selectCover = false.obs;

  String profileImage = '';
  File? profile;
  RxBool profileImageSelected = false.obs;

  removePhoto() {
    selectCover.value = false;
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
      selectCover.value = true;
    } else {
      // User canceled the picker
      selectCover.value = false;
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
    if (profileImage.isNotEmpty) {
      if (formkey.currentState!.validate()) {
        ApiCall api = await profileAPI.updateProfile(
            name: username.text, about: about.text, profile: profileImage);
        if (api.status) {
          loadProfile();
          isEditing.value = false;
        } else {
          customSnackbar(message: api.message);
        }
      }
    } else {
      customSnackbar(message: "Please Select Profile Image");
    }
  }

  void loadProfile() async {
    isDataLoaded.toggle();
    ApiCall response = await profileAPI.loadProfile();
    if (response.status) {
      profileData = response.response;
      print(response.response);
    } else {
      customSnackbar(message: response.message);
    }
    isDataLoaded.toggle();
  }
}
