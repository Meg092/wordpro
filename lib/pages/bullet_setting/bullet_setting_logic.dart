import 'package:bullet_comments/db_bullet/db_bullet.dart';
import 'package:bullet_comments/pages/bullet_main/bullet_main_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BulletSettingLogic extends GetxController {

  DBBullet dbBullet = Get.find();

  cleanBulletData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbBullet.cleanAllData();
            BulletMainLogic mainLogic = Get.find();
            mainLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutBulletUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 72,
        height: 72,
      ),
      children: [
        const Text(
            """We can provide you with custom bullet comments"""),
      ],
      context: context,
    );
  }

}
