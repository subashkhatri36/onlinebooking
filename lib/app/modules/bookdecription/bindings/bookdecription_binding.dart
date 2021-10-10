import 'package:get/get.dart';

import '../controllers/bookdecription_controller.dart';

class BookdecriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookdecriptionController>(
      () => BookdecriptionController(),
    );
  }
}
