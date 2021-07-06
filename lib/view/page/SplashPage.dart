import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/MainPage.dart';
import 'package:sportapplication/view/page/login/LoginPage.dart';
import 'package:sportapplication/view/page/profile/profileConstance.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  final check = RegisterFunction.to;
  bool error = false;
  String _token;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    Timer(Duration(seconds: 2), () => _setTimer());
    print("Get.deviceLocale=>      ${Get.deviceLocale}");
    // Get.updateLocale(Locale("fa" ,"IR"));
    super.initState();
  }

  checkLogin() {
    check.checkLogin(token: _token).then((value) {
      switch (value) {
        case 200:
          Get.off(MainPage());
          break;
        case 201:
          Get.off(LoginPage());
          break;
        default:
          if (mounted) {
            setState(() {
              error = true;
            });
          }
          break;
      }
    });
  }

  _setTimer() {
    getShared("token").then((token) {
      _token = token;
      check.checkUpdate().then((value) {
        if (value != null) {
          getVersion().then((version) {
            if (version == value.version) {
              checkLogin();
            } else {
              if(value.update_required){
                importImageSelectBottomSheet(
                    context: context,
                    title: 'بروزرسانی',
                    title2: 'خروج',
                    ontap: () {
                      launchURL(value.download_link);
                    },
                    ontap2: () {
                      exit(1);
                    });
              }else{
                importImageSelectBottomSheet(
                    context: context,
                    title: 'بروزرسانی',
                    title2: 'ادامه',
                    ontap: () {
                      launchURL(value.download_link);
                    },
                    ontap2: () {
                      Get.back();
                      checkLogin();
                    });
              }
            }
          });
        } else {
          if (mounted) {
            setState(() {
              error = true;
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                ])),
            child: Center(
              child: Image.asset(
                'assets/image/icon.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
          error
              ? Container(
                  decoration:
                      BoxDecoration(color: Colors.black26.withOpacity(.6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (mounted) {
                            setState(() {
                              error = false;
                              _setTimer();
                            });
                          }
                        },
                        child: Container(
                          color: Colors.white,
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                          width: Get.width,
                          child: Center(
                            child: Text(
                              "تلاش مجدد",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
              : Container(),
        ],
      ),
    );
  }

}

