import 'package:bullet_comments/db_bullet/db_bullet.dart';
import 'package:bullet_comments/pages/bullet_add/bullet_add_binding.dart';
import 'package:bullet_comments/pages/bullet_add/bullet_add_view.dart';
import 'package:bullet_comments/pages/bullet_add/bullet_font_list.dart';
import 'package:bullet_comments/pages/bullet_details/bullet_details_binding.dart';
import 'package:bullet_comments/pages/bullet_details/bullet_details_view.dart';
import 'package:bullet_comments/pages/bullet_fail/bullet_fail_binding.dart';
import 'package:bullet_comments/pages/bullet_fail/bullet_fail_view.dart';
import 'package:bullet_comments/pages/bullet_main/bullet_main_binding.dart';
import 'package:bullet_comments/pages/bullet_main/bullet_main_view.dart';
import 'package:bullet_comments/pages/bullet_scroll/bullet_scroll_binding.dart';
import 'package:bullet_comments/pages/bullet_scroll/bullet_scroll_view.dart';
import 'package:bullet_comments/pages/bullet_setting/bullet_setting_binding.dart';
import 'package:bullet_comments/pages/bullet_setting/bullet_setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff05a1ed);
Color bgColor = const Color(0xfff4f4f4);

List<String> bulletFamilyList = [
  'Shadows_Into_Light',
  'Permanent_Marker',
  'Josefin_Sans',
  'Bitcount_Grid_Double',
  'Alfa_Slab_One'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBBullet().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pexel,
      initialRoute: '/bullet',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Pexel = [
  GetPage(name: '/bullet', page: () => const BulletScrollView(), binding: BulletScrollBinding()),
  GetPage(name: '/bullet_main', page: () => const BulletMainPage(), binding: BulletMainBinding()),
  GetPage(name: '/bullet_fail', page: () => BulletFailView(), binding: BulletFailBinding()),
  GetPage(name: '/bullet_add', page: () => BulletAddPage(), binding: BulletAddBinding()),
  GetPage(name: '/bullet_font', page: () => BulletFontList()),
  GetPage(name: '/bullet_details', page: () => BulletDetailsPage(), binding: BulletDetailsBinding()),
  GetPage(name: '/bullet_setting', page: () => BulletSettingPage(), binding: BulletSettingBinding()),
];