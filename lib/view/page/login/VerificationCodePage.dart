import 'package:flutter/material.dart';
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
                  'تا ثانیه های دیگر کد احراز هویت برای شما ارسال میشود. کد را وارد کنید',
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
                      Get.to(RegisterPage(place: reg,));
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
