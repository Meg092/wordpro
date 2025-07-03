import 'package:get/get.dart';

import 'bullet_setting_logic.dart';

class BulletSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BulletSettingLogic());
  }
}
