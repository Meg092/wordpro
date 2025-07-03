import 'package:get/get.dart';

import 'bullet_scroll_logic.dart';

class BulletScrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      BulletScrollLogic(),
      permanent: true,
    );
  }
}
