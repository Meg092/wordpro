import 'package:get/get.dart';

import 'bullet_details_logic.dart';

class BulletDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BulletDetailsLogic());
  }
}
