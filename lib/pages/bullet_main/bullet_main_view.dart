import 'package:bullet_comments/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:marquee/marquee.dart';
import 'package:styled_widget/styled_widget.dart';

import 'bullet_main_logic.dart';
import 'custom_marquee.dart';

class BulletMainPage extends StatefulWidget {
  const BulletMainPage({Key? key}) : super(key: key);

  @override
  State<BulletMainPage> createState() => _BulletMainPageState();
}

class _BulletMainPageState extends State<BulletMainPage> {
  BulletMainLogic controller = Get.find();

  void oiuaohkm() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/bullet_fail');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    oiuaohkm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
            onPressed: () {
              Get.toNamed('/bullet_setting')?.then((_) {});
            },
            icon: Image.asset(
              'assets/icon0.webp',
              fit: BoxFit.cover,
              width: 28,
              height: 28,
            )),
      ),
      body: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        Image.asset(
          'assets/bg0.webp',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: 210,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 53,
              child: <Widget>[
                const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Add bullet comments')
              ].toRow(mainAxisAlignment: MainAxisAlignment.center),
            )
                .decorated(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          offset: Offset(0, 6))
                    ],
                    borderRadius: BorderRadius.circular(35))
                .marginSymmetric(horizontal: 20)
                .gestures(onTap: () {
              Get.toNamed('/bullet_add')?.then((_) async {
                await SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
                controller.getData();
              });
            })),
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Obx(() {
            return controller.list.value.isEmpty
                ? const Center(
                    child: Text('No data'),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.list.value.length,
                    itemBuilder: (_, index) {
                      final entity = controller.list.value[index];
                      return LayoutBuilder(builder: (_, max) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: double.infinity,
                            height: 131,
                            padding: const EdgeInsets.all(12),
                            child: CustomMarquee(
                              text: entity.content,
                              textStyle: TextStyle(
                                fontSize: 45,
                                fontFamily: bulletFamilyList[entity.fontFamily],
                                height: 0.8,
                                color: entity.wordColorValue,
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
                                          'assets/bigBG${entity.bgColor}.webp'),
                                      fit: BoxFit.cover))
                              .gestures(onTap: () {
                            Get.toNamed('/bullet_details',arguments: entity)?.then((_) async {
                              await SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                              controller.getData();
                            });
                          }),
                        );
                      }).marginOnly(bottom: 10);
                    });
          }),
        )
            .decorated(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)))
            .marginOnly(top: 280, bottom: 20),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg1.webp',
              width: double.infinity,
              fit: BoxFit.cover,
            )),
      ].toStack(),
    );
  }
}
