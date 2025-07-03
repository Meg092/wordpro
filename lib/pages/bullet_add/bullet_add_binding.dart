import 'package:get/get.dart';

import 'bullet_add_logic.dart';

class BulletAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BulletAddLogic());
  }
}
