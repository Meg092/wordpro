import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'bullet_setting_logic.dart';

class BulletSettingPage extends GetView<BulletSettingLogic> {

  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'About app'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanBulletData();
          break;
        case 1:
          controller.aboutBulletUS(context);
          break;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'),backgroundColor: Colors.white,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context)
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white, borderRadius: BorderRadius.circular(12))
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).marginAll(15)),
      )
    );
  }
}
