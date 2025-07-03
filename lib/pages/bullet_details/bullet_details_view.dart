import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import '../bullet_main/custom_marquee.dart';
import 'bullet_details_logic.dart';

class BulletDetailsPage extends GetView<BulletDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        automaticallyImplyLeading: false,
        actions: [
          Image.asset(
            'assets/close.webp',
            fit: BoxFit.cover
          ).marginOnly(right: 20,top: 15).gestures(onTap: (){
            Get.until( (v) => Get.currentRoute == '/bullet_main');
          })
        ],
      ),
      body: LayoutBuilder(builder: (_, max) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(12),
            child: CustomMarquee(
              text: controller.entity.content,
              textStyle: TextStyle(
                fontSize: 70,
                fontFamily: bulletFamilyList[controller.entity.fontFamily],
                height: 0.8,
                color: controller.entity.wordColorValue,
                fontWeight: FontWeight.bold,
              ),
              velocity: 120.0,
              blankSpace: max.maxWidth - 24,
              fadingEdgeColor: Colors.black,
            ),
          )
              .decorated(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/bigBG${controller.entity.bgColor}.webp'),
                  fit: BoxFit.cover))
        );
      }),
    );
  }
}
