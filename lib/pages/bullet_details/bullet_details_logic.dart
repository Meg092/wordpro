import 'package:bullet_comments/db_bullet/bullet_entity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BulletDetailsLogic extends GetxController {

  BulletEntity entity = Get.arguments;

  @override
  void onInit() async {
    // TODO: implement onInit
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.onInit();
  }

}
