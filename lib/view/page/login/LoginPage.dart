import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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
  final RegisterFunction check = Get.put(RegisterFunction());
  bool _clicked = false;

  @override
  void initState() {
    _mobController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _mobController.dispose();
    _passController.dispose();
    super.dispose();
  }

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
                          onPressed: () {},
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
                            check
                                .login(
                                    mobile: _mobController.text,
                                    pass: _passController.text)
                                .then((value) {
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
