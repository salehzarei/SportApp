import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/AppFunction.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/Functions/ProfileFunction.dart';
import 'package:sportapplication/controller/Functions/ProfileFunctions.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';
import 'package:sportapplication/controller/TextTranslations.dart';
import 'package:sportapplication/view/page/SplashPage.dart';

import 'controller/Functions/GalleryFunction.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white);

  //  show satus bar
  // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  //hide
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  //transparent
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.tr, statusBarIconBrightness: Brightness.dark));

//Red=====>Color(0xffE24A62)
  Get.put(AppFunction());
  Get.put(ArticleFunction());
  Get.put(RegisterFunction());
  Get.put(PackageFunction());
  Get.put(SliderFunction());
  Get.put(Controller());
  Get.put(SubSetFunction());
  Get.put(ProfileFunctions());
  Get.put(ProfileFunction());
  Get.put(PlanFunction());
  Get.put(GalleryFunction());

  runApp(GetMaterialApp(
    title: 'Sport+',
    translations: TextTranslations(),
    // locale: Get.deviceLocale,
    // locale: Locale("fa" ,"IR"),
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
    theme: ThemeData(
        // backgroundColor: Colors.white.withOpacity(.9),
        backgroundColor: Colors.white,
        primaryColor: Colors.red[900],
        // primaryColorDark: Colors.red,
        primaryColorDark: Color(0xffE83B4D),
        accentColor: Colors.white,
        cardColor: Colors.white,
        brightness: Brightness.light,
        buttonColor: Color(0xffE24A62),
        colorScheme: ColorScheme(
            primary:  Colors.red,
            primaryVariant: Colors.red[900],
            secondary:Colors.red[900],
            secondaryVariant: Colors.red[900],
            surface:Colors.white,
            background:Colors.red[900],
            error:Colors.red[900],
            onPrimary: Colors.white,
            onSecondary: Colors.red[900],
            onSurface: Colors.red[900],
            onBackground:Colors.red[900],
            onError:Colors.red[900],
            brightness: Brightness.light),
        // iconTheme: IconThemeData(color: Color(0xffE24A62)),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
        ),
        fontFamily: 'Yekan',
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xffE24A62),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        )),
  ));

}
