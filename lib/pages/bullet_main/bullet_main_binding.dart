import 'package:get/get.dart';

import 'bullet_main_logic.dart';

class BulletMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BulletMainLogic());
  }
}
