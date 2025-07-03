import 'package:bullet_comments/db_bullet/bullet_entity.dart';
import 'package:bullet_comments/db_bullet/db_bullet.dart';
import 'package:get/get.dart';

class BulletMainLogic extends GetxController {

  DBBullet dbBullet = Get.find();

  var list = <BulletEntity>[].obs;

  void getData() async {
    list.value = await dbBullet.getBulletAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
