import 'package:get/get.dart';

import '../controllers/bookread_controller.dart';

class BookreadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookreadController>(
      () => BookreadController(),
    );
  }
}
