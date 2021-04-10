import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Controller/Functions/Controller.dart';
import 'Views/Home.dart';

class HomePage extends StatelessWidget {
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
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'جستجو در اسپورت'),
                              ))
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.shopping_basket_outlined),
                      ],
                    ),
                  ),
                ),
                ///////////////////////////main//////////////////////////////
                active.activclick.value == 0 ? Home() : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
