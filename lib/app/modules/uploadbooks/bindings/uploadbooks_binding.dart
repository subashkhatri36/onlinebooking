import 'package:get/get.dart';

import '../controllers/uploadbooks_controller.dart';

class UploadbooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadbooksController>(
      () => UploadbooksController(),
    );
  }
}
