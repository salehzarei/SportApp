import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/component/appBarWidget.dart';
import 'package:sportapplication/view/component/navigationBarWidget.dart';
import 'package:sportapplication/view/page/category/CategoriesPage.dart';
import 'package:sportapplication/view/page/home/Home.dart';
import 'package:sportapplication/view/page/map/AroundTab.dart';
import 'package:sportapplication/view/page/profile/Profile.dart';

class MainPage extends StatelessWidget {
  final Controller active = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(
          () => Scaffold(
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
    );
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
        return Container();
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
