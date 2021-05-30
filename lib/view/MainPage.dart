import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/FirebaseNotificationHandler.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/appBarWidget.dart';
import 'package:sportapplication/view/component/navigationBarWidget.dart';
import 'package:sportapplication/view/page/category/CategoriesPage.dart';
import 'package:sportapplication/view/page/home/Home.dart';
import 'package:sportapplication/view/page/map/AroundTab.dart';
import 'package:sportapplication/view/page/plan/PlanPage.dart';
import 'package:sportapplication/view/page/profile/Profile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  GlobalKey<ScaffoldState> _scaffoldKey;
  final Controller active = Get.put(Controller());

  FirebaseNotifications firebaseNotifications = FirebaseNotifications();
  DateTime currentBackPressTime;

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    firebaseNotifications.setupFirebase(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(
        () => WillPopScope(
          onWillPop:() => _onBackPressed(),
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              bottomNavigationBar:NavigationBarWidget(controller: active),
              body: Column(
                children: [
                  active.activclick.value != 4
                      ? AppBarWidget(from: 0, onBackPressed: () {  }, onShopPressed: () {  },)
                      : Container(),
                  _pageView(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if( active.activclick.value  == 0){
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 1)) {
        currentBackPressTime = now;
        toast(msg: "برای خروج مجددا دکمه فشار دهید", textColor: Colors.white, backgroundColor: Colors.red, fontSize: 14.4);
      }else{
        exit(1);
      }


    } else {
      active.activclick(0);
    }
  }

  _pageView() {
    switch (active.activclick.value) {
      case 0:
        return Home();
        break;
      case 1:
        return CategoriesPage();
        break;
      case 2:
        return PackagePage();
        break;
      case 3:
        return AroundTab();
        break;
      case 4:
        return Profile();
        break;
    }
  }
}
