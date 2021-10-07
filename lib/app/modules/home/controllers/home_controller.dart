import 'package:get/get.dart';
import 'package:onlinebooks/app/constant/asset_image.dart';
import 'package:onlinebooks/app/constant/string.dart';
import 'package:onlinebooks/app/data/model/category_list.dart';
import 'package:onlinebooks/app/data/model/home_model.dart';
import 'package:onlinebooks/app/data/model/response_model.dart';
import 'package:onlinebooks/app/data/repositories/home_api.dart';
import 'package:onlinebooks/app/widgets/custom_snackbar.dart';

class HomeController extends GetxController {
  String homeTitle = Strings.appName;
  //loading data
  RxBool isloadingdata = false.obs;
  RxList<CategoryList> categoryList =
      List<CategoryList>.empty(growable: true).obs;
  RxList<Home> homeList = List<Home>.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
    gettingHomeData();
  }

  //getting home data from api
  void gettingHomeData() async {
    isloadingdata.toggle();

    ApiCall apiCall = await homeApi.home();
    if (apiCall.status) {
    } else {
      customSnackbar(title: "Error", message: apiCall.message);
    }

    List<CategoryList> categoryLists = [
      CategoryList(id: 1, name: 'Drama', image: AppImage.dramaImage),
      CategoryList(id: 1, name: 'Children', image: AppImage.childrenImage),
      CategoryList(id: 1, name: 'Dectative', image: AppImage.dectativeImage),
      CategoryList(id: 1, name: 'Fantasy', image: AppImage.fantasyImage),
      CategoryList(id: 1, name: 'Horror', image: AppImage.horrorImage),
      CategoryList(id: 1, name: 'Melo Drama', image: AppImage.melodramaImage),
      CategoryList(id: 1, name: 'Non Frictions', image: AppImage.nonfriction),
      CategoryList(id: 1, name: 'Poetry', image: AppImage.poetryImage),
      CategoryList(id: 1, name: 'Psychology', image: AppImage.psychologyImage),
      CategoryList(id: 1, name: 'Short Story', image: AppImage.shortImage),
    ];
    categoryList = categoryLists.obs;
    isloadingdata.toggle();
  }

  @override
  void onClose() {}
}
