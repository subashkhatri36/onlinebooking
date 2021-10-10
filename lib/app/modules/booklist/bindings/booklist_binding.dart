import 'package:get/get.dart';

import '../controllers/booklist_controller.dart';

class BooklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooklistController>(
      () => BooklistController(),
    );
  }
}
