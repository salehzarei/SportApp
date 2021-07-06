import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

import 'VerificationCodePage.dart';

class CheckPhonePage extends StatefulWidget {
  @override
  _CheckPhonePageState createState() => _CheckPhonePageState();
}

class _CheckPhonePageState extends State<CheckPhonePage> {
  final check = RegisterFunction.to;

  TextEditingController _mobileController;
  bool _clicked = false;

  @override
  void initState() {
    _mobileController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _mobileController.dispose();
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
          body:Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/image/back.png'
                      ),
                      fit: BoxFit.fill
                  )
              ),
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
                      controllers:_mobileController,
                      labeltext: 'شماره همراه',
                      obscureText: false,
                      icons: Icon(Icons.phone_android_outlined),
                      textInputType: TextInputType.phone,),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: Get.width,
                    height: 40,
                    child:ElevatedButton(
                      onPressed: () {
                        if(_mobileController.text.isEmpty){
                          errorSnackBar(text: 'موبایل را وارد کنید', error: true, context: context);
                          return;
                        }
                        if(_mobileController.text.length != 11){
                          errorSnackBar(text: 'موبایل را اشتباه وارد کرده اید!', error: true, context: context);
                          return;
                        }
                          setState(() {
                            _clicked = true;
                          });
                        check.checkMobile(_mobileController.text).then((value) {
                          if(value == 200){
                            check.getVerificationCode(_mobileController.text).then((value2){
                              setState(() {
                                _clicked = false;
                              });
                              if(value2 == 200){
                                check.mobile.value=_mobileController.text;
                                Get.to(VerificationCodePage());
                              }else{
                                listSnackBar(list: check.errorMassages, err: true);
                              }
                            });
                          }else{
                            setState(() {
                              _clicked = false;
                            });
                            listSnackBar(list: check.errorMassages, err: true);
                          }
                        });
                      },
                      child: _clicked ? Center(
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ):Text(
                        "ثبت و ارسال",
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
}
