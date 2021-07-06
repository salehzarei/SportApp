import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

import '../../MainPage.dart';
import 'CheckPhonePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobController;
  TextEditingController _passController;

  TextEditingController _codeController;
  TextEditingController _newPassController;

  FocusNode _codeFocus;
  FocusNode _newPassFocus;

  final FirebaseMessaging _firebaseToken = FirebaseMessaging();
  final check = RegisterFunction.to;
  bool _clicked = false;

  @override
  void initState() {
    _mobController = TextEditingController();
    _passController = TextEditingController();

    _codeController = TextEditingController();
    _newPassController = TextEditingController();

    _codeFocus = FocusNode();
    _newPassFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {

    _mobController.dispose();
    _passController.dispose();

    _codeController.dispose();
    _newPassController.dispose();
    _codeFocus.dispose();
    _newPassFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            leading:  Icon(Icons.arrow_back_rounded,size: 0,),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/image/back.png'
                  ),
                  fit: BoxFit.fill
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('لطفا برای ورود موبایل و رمز عبور را وارد کنید'),
                  SizedBox(
                    height: 20,
                  ),
                  textFieldLogin(
                      context: context,
                      icons: Icon(Icons.phone_android_outlined),
                      obscureText: false,
                      labeltext: ' موبایل ',
                      controllers: _mobController,
                      maxLength: 11,
                      textInputType: TextInputType.phone),
                  SizedBox(
                    height: 20,
                  ),
                  textFieldLogin(
                      context: context,
                      icons: Icon(Icons.lock),
                      obscureText: true,
                      labeltext: 'رمز عبور',
                      controllers: _passController,
                      maxLength: 11,
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
                            if(_mobController.text.isEmpty){
                              errorSnackBar(context: context,text: 'شماره موبایل را وارد نمایید',error: true);
                            }else{
                              check.getVerificationCode(_mobController.text).then((value) {
                                    if(value == 200){
                                      _codeController.text = '';
                                      _newPassController.text = '';
                                      botSheet(context: context,
                                          controller: _newPassController,
                                          codeController: _codeController,
                                          focusNode: _newPassFocus,
                                          codeFocus: _codeFocus,
                                          changePass: (){
                                            check.resetPass(
                                                mobile: _mobController.text,
                                                code: _codeController.text,
                                                pass: _newPassController.text,
                                                verification_token: check.verificationCode.value).then((value){
                                              if(value == 200){
                                                Get.back();
                                                listSnackBar(list: check.errorMassages, err: false);
                                              }else{
                                                listSnackBar(list: check.errorMassages, err: true);
                                              }
                                            });
                                          });
                                    }else{
                                      listSnackBar(list: check.errorMassages, err: true);
                                    }
                              });
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.red))),
                              child: Text(
                                'فراموشی رمز عبور',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
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
                            if (_mobController.text.isEmpty) {
                              if (mounted) {
                                setState(() {
                                  errorSnackBar(text: 'موبایل را وارد کنید', error: true,context: context);
                                });
                                return;
                              }
                            }
                            if (_mobController.text.length < 11) {
                              if (mounted) {
                                setState(() {
                                  errorSnackBar(text: 'موبایل را کامل وارد کنید', error: true,context: context);
                                });
                                return;
                              }
                            }
                            if (_passController.text.isEmpty) {
                              if (mounted) {
                                setState(() {
                                  errorSnackBar(text: 'رمز عبور را وارد کنید', error: true,context: context);
                                });
                                return;
                              }
                            }
                            if (mounted) {
                              setState(() {
                                _clicked = true;
                              });
                            }
                            _firebaseToken.getToken().then((pushToken) {
                              check.login(
                                  mobile: _mobController.text,
                                  pass: _passController.text, firebase_token: pushToken)
                                  .then((value)  {
                                if (value == 200) {

                                  Get.off(MainPage());
                                } else {
                                  if (mounted) {
                                    setState(() {
                                      _clicked = false;
                                      listSnackBar(list: check.errorMassages, err: true);
                                    });
                                  }
                                }
                              });
                            });

                          },
                          child:_clicked? Center(
                            child: SpinKitThreeBounce(
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ):Text(
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
      ),
    );
  }
}
