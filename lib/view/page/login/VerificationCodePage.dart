import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/login/NewRegisterPage.dart';

class VerificationCodePage extends StatefulWidget {


  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  final check = RegisterFunction.to;

  Timer _timer;
  int _start = 180;
  String _time=" ";
  String _code;
  String a ="0";

  TextEditingController _codeNumber;
  bool _clicked = false;

  @override
  void initState() {
    _codeNumber = TextEditingController();
    _time = _start.toString();
    _initSms();

    startTimer();
    super.initState();
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
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
    _codeNumber.dispose();
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: PinFieldAutoFill(
                    decoration: UnderlineDecoration(
                      colorBuilder: PinListenColorBuilder(Colors.red[600], Colors.grey[300]),
                    ),
                    controller: _codeNumber,
                    onCodeSubmitted: (code) {
                       setState(() {
                         _code = code;
                         _clicked = true;
                       });
                       _verificationReq();
                    },
                    currentCode:_code ,
                    codeLength: 4,
                    onCodeChanged: (code) {
                     _code = code;
                      print(code);
                      if (code.length == 4) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          _clicked = true;
                        });
                        _verificationReq();
                      }
                    },
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
                ),
                Container(
                    margin: EdgeInsets.only(top: 15,right: 30 , left: 30 , bottom: 40),
                    width: Get.width,
                    height: 40,
                    child:ElevatedButton(
                      onPressed: () {
                        if(_codeNumber.text.isEmpty){
                          errorSnackBar(text: 'کد تایید را وارد کنید', error: true, context: context);
                          return;
                        }
                        _verificationReq();
                      },
                      child: _clicked ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ):Text(
                        "ثبت و ادامه",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red)),
                    )

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verificationReq(){
    setState(() {
      _clicked = true;
    });
    check.checkVerificationCodes(_codeNumber.text).then((value) {
      setState(() {
        _clicked = false;
      });
      if(value == 200){
        check.code.value = _codeNumber.text;
        Get.to(NewRegisterPage());
      }else{
        listSnackBar(list: check.errorMassages,err: true);
      }
    });
  }

  Future<void> _initSms() async {
    await SmsAutoFill().listenForCode;
  }
}
