import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/SplashPage.dart';

//Color(0xfffbc02d)
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

  runApp(GetMaterialApp(
    title: 'Sport+',
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
    theme: ThemeData(
        // backgroundColor: Colors.white.withOpacity(.9),
        backgroundColor: Colors.white,
        primaryColor: Colors.red[900],
        primaryColorDark: Colors.red,
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
