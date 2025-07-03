import 'package:get/get.dart';

import 'bullet_fail_logic.dart';

class BulletFailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BulletFailLogic());
  }
}
