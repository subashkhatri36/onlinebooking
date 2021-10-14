import 'package:get/get.dart';

import '../controllers/savedbook_controller.dart';

class SavedbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedbookController>(
      () => SavedbookController(),
    );
  }
}
