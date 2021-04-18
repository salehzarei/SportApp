import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';

import 'RegisterPage.dart';

class VerificationCodePage extends StatelessWidget {
  RegisterFunction reg;
  VerificationCodePage({@required this.reg});

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
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                alignment: Alignment.center,
                child: Text(
                  'تا ثانیه های دیگر کد احراز هویت برای شماره ${reg.mobile.text} ارسال میشود. کد را وارد کنید',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: FittedBox(
                  child: PinCodeTextField(
                    onDone: (text) {
                      reg.code.value = text;
                      print('reg.code.value');
                      print(reg.code.value);
                      reg
                          .checkVerificationCode(reg.mobile.text, text)
                          .whenComplete(() {
                        if (reg.checkerror.value == true) {
                          Get.snackbar(
                            '',
                            '',
                            titleText: Text(''),
                            messageText: Container(
                              // height: 300,
                              child: ListView.builder(
                                  itemCount: reg.errorMassages.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: HtmlWidget(
                                        reg.errorMassages[index],
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
                          Get.to(RegisterPage(
                            place: reg,
                          ));
                        }
                      });
                    },
                    autofocus: true,
                    // controller: controller,
                    hideCharacter: false,
                    highlight: true,
                    highlightColor: Colors.red,
                    defaultBorderColor: Colors.red,
                    hasTextBorderColor: Colors.green,
                    maxLength: 4,
                    pinBoxWidth: 70,
                    pinBoxHeight: 40,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinTextStyle:
                        TextStyle(fontSize: 22.0, color: Colors.black),
                    pinTextAnimatedSwitcherTransition:
                        ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                        Duration(milliseconds: 150),

                    highlightAnimationBeginColor: Colors.black,
                    // highlightAnimationEndColor: Colors.blue,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
