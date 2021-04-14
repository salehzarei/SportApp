import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/MainPage.dart';
import 'package:sportapplication/view/component/Constans.dart';

import 'CheckPhonePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // @override
  // void initState() {
  //   place.getPlaceData().then((v) {
  //     place.ostanLoding.value = false;
  //     if (place.ostanSelected > 0) {
  //       place.fetchCity(place.ostanSelected.value);
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                'ورود',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('لطفا برای ورود نام کاربری و رمز عبور را وارد کنید'),
                SizedBox(
                  height: 20,
                ),
                textFieldLogin(
                    context: context,
                    icons: Icon(Icons.phone_android_outlined),
                    obscureText: false,
                    labeltext: 'نام کاربری',
                    textInputType: TextInputType.number),
                SizedBox(
                  height: 20,
                ),
                textFieldLogin(
                    context: context,
                    icons: Icon(Icons.lock),
                    obscureText: true,
                    labeltext: 'رمز عبور',
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {

                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.blue))),
                            child: Text(
                              'فراموشی رمز عبور',
                            ))),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(MainPage());
                        },
                        child: Text(
                          'ورود',
                          textAlign: TextAlign.center,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(CheckPhonePage());
                        },
                        child: Text(
                          'ثبت نام',
                          textAlign: TextAlign.center,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
