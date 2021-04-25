import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

import 'VerificationCodePage.dart';

class CheckPhonePage extends StatelessWidget {
  final RegisterFunction check = Get.put(RegisterFunction());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'ثبت نام',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('شماره همراه خود را وارد کنید'),
                  SizedBox(
                    height: 15,
                  ),
                  textFieldLogin(
                      context: context,
                      maxLength: 11,
                      controllers: check.mobile,
                      labeltext: 'شماره همراه',
                      obscureText: false,
                      textInputType: TextInputType.text,
                      icons: null),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 40,
                    child: check.checkLoginLoading.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            // color: Colors.white,
                            onPressed: () {},
                            child: Center(
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 15.0,
                              ),
                            ))
                        : ElevatedButton(
                            onPressed: () {
                              if ( check.mobile.text.isEmpty) {
                                Get.snackbar(
                                  '',
                                  '',
                                  titleText: Text(''),
                                  messageText: Text(
                                    'موبایل را وارد کنید',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  icon: Icon(
                                    Icons.error,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                );
                              } else if ( check.mobile.text.length != 11) {
                                Get.snackbar(
                                  '',
                                  '',
                                  titleText: Text(''),
                                  messageText: Text(
                                    'شماره باید ۱۱ رقم باشد',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  icon: Icon(
                                    Icons.error,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                );
                              } else {
                                check
                                    .checkMobile( check.mobile.text)
                                    .whenComplete(() {
                                  if (check.checkerror.value == true) {
                                    Get.snackbar(
                                      '',
                                      '',
                                      titleText: Text(''),
                                      messageText: Container(
                                        // height: 300,
                                        child: ListView.builder(
                                            itemCount:
                                                check.errorMassages.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: HtmlWidget(
                                                  check.errorMassages[index],
                                                  // onTapUrl: (url) =>
                                                  //     print('tapped $url'),
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      // letterSpacing: 10,
                                                      // textBaseline: TextBaseline.alphabetic,
                                                      height: 2.5,
                                                      fontSize: 18),
                                                ),
                                              );
                                              // return Text(
                                              //   register.errorMassages[index],
                                              //   textDirection: TextDirection.rtl,
                                              //   style: TextStyle(
                                              //       color: Colors.white, fontSize: 18),
                                              // );
                                            }),
                                      ),
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      icon: Icon(
                                        Icons.error,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    );
                                    // check.update();
                                  } else {
                                    check
                                        .getVerificationCode( check.mobile.text)
                                        .whenComplete(() {
                                      if (check.checkerror.value == true) {
                                        Get.snackbar(
                                          '',
                                          '',
                                          titleText: Text(''),
                                          messageText: Container(
                                            // height: 300,
                                            child: ListView.builder(
                                                itemCount:
                                                    check.errorMassages.length,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: HtmlWidget(
                                                      check
                                                          .errorMassages[index],
                                                      // onTapUrl: (url) =>
                                                      //     print('tapped $url'),
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          // letterSpacing: 10,
                                                          // textBaseline: TextBaseline.alphabetic,
                                                          height: 2.5,
                                                          fontSize: 18),
                                                    ),
                                                  );
                                                  // return Text(
                                                  //   register.errorMassages[index],
                                                  //   textDirection: TextDirection.rtl,
                                                  //   style: TextStyle(
                                                  //       color: Colors.white, fontSize: 18),
                                                  // );
                                                }),
                                          ),
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          icon: Icon(
                                            Icons.error,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        );
                                      } else {
                                        Get.offAll(VerificationCodePage(
                                          reg: check,
                                        ));
                                        // check.mobile(_mobile.text);
                                      }
                                    });

                                    // check.mobile.value = _mobile.text;
                                  }
                                });
                              }
                            },
                            child: Text(
                              'دریافت کد',
                              textAlign: TextAlign.center,
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
