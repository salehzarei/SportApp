import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sportapplication/view/MainPage.dart';

import 'view/page/login/LoginPage.dart';

//Color(0xfffbc02d)
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //  show satus bar
  // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  //hide
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  //transparent
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.tr, statusBarIconBrightness: Brightness.dark));

//Red=====>Color(0xffE24A62)

  runApp(GetMaterialApp(
    title: 'Sport+',
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: ThemeData(
        // backgroundColor: Colors.white.withOpacity(.9),
        backgroundColor: Colors.white,
        primaryColor: Color(0xffE24A62),
        accentColor: Colors.white,
        cardColor: Colors.white,
        buttonColor: Color(0xffE24A62),
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
