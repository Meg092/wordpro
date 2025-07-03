import 'package:bullet_comments/main.dart';
import 'package:bullet_comments/pages/bullet_add/bullet_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'bullet_add_logic.dart';

class BulletAddPage extends GetView<BulletAddLogic> {
  Widget _fontFamilyItem(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Text(
        bulletFamilyList[index],
        style: TextStyle(
            fontSize: 16,
            height: 0.8,
            fontFamily: bulletFamilyList[index],
            fontWeight: FontWeight.bold),
      ),
    )
        .decorated(
            borderRadius: BorderRadius.circular(10),
            border: controller.fontFamily == index
                ? Border.all(color: primaryColor)
                : null)
        .gestures(onTap: () {
      controller.fontFamily = index;
      controller.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bullet comments'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<BulletAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: BulletTextField(
                    padding: EdgeInsets.zero,
                    value: controller.content,
                    maxLines: 6,
                    maxLength: 20,
                    onChange: (v) {
                      controller.content = v;
                    }),
              ).decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffbebebe).withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3))
                  ]),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'Text color',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ColorPicker(
                      pickerColor: controller.wordColor,
                      onColorChanged: (v) {
                        controller.wordColor = v;
                        controller.update();
                      })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffbebebe).withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3))
                  ]),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'Select background',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 51,
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, mainAxisSpacing: 18),
                        itemCount: 5,
                        itemBuilder: (_, index) {
                          return <Widget>[
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                            ).decorated(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/smallBG$index.webp'),
                                    fit: BoxFit.cover)),
                            Visibility(
                                visible: index == controller.bgColor,
                                child: Image.asset(
                                  'assets/icon1.webp',
                                  fit: BoxFit.cover,
                                ))
                          ].toStack(alignment: Alignment.center).gestures(
                              onTap: () {
                            controller.bgColor = index;
                            controller.update();
                          });
                        }),
                  )
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffbebebe).withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3))
                  ]),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'Font family',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _fontFamilyItem(0),
                        _fontFamilyItem(1),
                        _fontFamilyItem(2),
                        _fontFamilyItem(3),
                        _fontFamilyItem(4)
                      ],
                    ),
                  )
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffbebebe).withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3))
                  ]),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 53,
                alignment: Alignment.center,
                child: const Text(
                  'Save and demonstrate',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
                  .decorated(
                      color: primaryColor,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(35))
                  .gestures(onTap: () {
                    controller.addBullet();
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
