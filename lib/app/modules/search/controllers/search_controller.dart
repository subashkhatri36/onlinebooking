import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onlinebooks/app/data/model/home_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/home_api.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class SearchController extends GetxController {
  TextEditingController searchtext = TextEditingController();
  RxBool isloadingdata = false.obs;

  Home? homeList;

  void searchBox() async {
    isloadingdata.toggle();
    if (searchtext.text.isNotEmpty) {
      ApiCall apiCall = await homeApi.home(searchkeyword: searchtext.text);
      if (apiCall.status) {
        homeList = Home(
            bookdetail: apiCall.response[0],
            categorylist: [],
            search: apiCall.response[2].toString().toLowerCase() == "true"
                ? true
                : false);

        // Future.delayed(Duration(seconds: 100));
      } else {
        customSnackbar(title: "Error", message: apiCall.message);
      }
    }

    isloadingdata.toggle();
  }

  @override
  void onClose() {}
}
