import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/login/NewRegisterPage.dart';

class VerificationCodePage extends StatefulWidget {


  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  final RegisterFunction check = Get.put(RegisterFunction());

  Timer _timer;
  int _start = 180;
  String _time;

  @override
  void initState() {
    _time = _start.toString();
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _time = 'ارسال مجدد کد';
          });
        } else {
          setState(() {
            _start--;
            _time = _start.toString();
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/back.png'),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Text(
                    'تا ثانیه های دیگر کد احراز هویت برای شماره ${check.mobile} ارسال میشود. کد را وارد کنید',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 15),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: FittedBox(
                    child: PinCodeTextField(
                      onDone: (text) {
                        check.checkVerificationCodes(text).then((value) {
                          if(value == 200){
                            check.code.value = text;
                            Get.offAll(NewRegisterPage());
                          }else{
                            listSnackBar(
                                list: check.errorMassages,
                                err: true);
                          }
                        });
                      },
                      autofocus: true,
                      // controller: controller,
                      hideCharacter: false,
                      highlight: true,
                      highlightColor: Colors.grey[600],
                      defaultBorderColor: Colors.grey[600],
                      hasTextBorderColor: Theme.of(context).primaryColorDark,
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
                InkWell(
                  onTap: () {
                    if (_start == 0) {
                      check.getVerificationCode(check.mobile.value).then((value) {
                        if(value == 200){
                          if (mounted) {
                            setState(() {
                              _start = 180;
                              startTimer();
                            });
                          }
                        }else{
                          listSnackBar(list: check.errorMassages, err: true);
                        }
                      });
                    }
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _time,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
