import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/component/appBarWidget.dart';
import 'package:sportapplication/view/page/home/Home.dart';
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
            bottomNavigationBar: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      if (active.activclick.value == 0) {
                      } else {
                        active.activclick(0);
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 40,
                          color: active.activclick.value == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        Text(
                          'خانه',
                          style: TextStyle(
                            color: active.activclick.value == 0
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      if (active.activclick.value == 1) {
                      } else {
                        active.activclick(1);
                      }
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 40,
                          color: active.activclick.value == 1
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        Text(
                          'دسته بندی',
                          style: TextStyle(
                            color: active.activclick.value == 1
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      if (active.activclick.value == 2) {
                      } else {
                        active.activclick(2);
                      }
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 40,
                          color: active.activclick.value == 2
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        Text(
                          'خرید بسته',
                          style: TextStyle(
                            color: active.activclick.value == 2
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      if (active.activclick.value == 3) {
                      } else {
                        active.activclick(3);
                      }
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 40,
                          color: active.activclick.value == 3
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        Text(
                          'اطراف من',
                          style: TextStyle(
                            color: active.activclick.value == 3
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      if (active.activclick.value == 4) {
                      } else {
                        active.activclick(4);
                      }
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 40,
                          color: active.activclick.value == 4
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                        Text(
                          'پروفایل',
                          style: TextStyle(
                            color: active.activclick.value == 4
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            body: Column(
              children: [
                active.activclick.value != 4
                    ? AppBarWidget()
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
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        return Profile();
        break;
    }
  }
}
