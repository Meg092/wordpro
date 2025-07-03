import 'package:bullet_comments/db_bullet/db_bullet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../db_bullet/bullet_entity.dart';

class BulletAddLogic extends GetxController {

  DBBullet dbBullet = Get.find();

  String content = '';
  Color wordColor = Colors.black;
  int bgColor = 0;
  int fontFamily = 0;

  void addBullet() async {
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    final entity =BulletEntity(
      id: 0,
      createdTime: DateTime.now(),
      content: content,
      wordColor: wordColor.toHexString(),
      bgColor: bgColor,
      fontFamily: fontFamily,
    );
    await dbBullet.insertBullet(entity);
    Get.toNamed('/bullet_details',arguments: entity);

  }

}
