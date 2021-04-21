import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/MainPage.dart';
import 'package:sportapplication/view/page/login/LoginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final RegisterFunction check = Get.put(RegisterFunction());
  bool error = false;
  @override
  void initState() {
    Timer(Duration(seconds: 2) ,()=>_setTimer());
    super.initState();
  }

  _setTimer(){
    getShared("token").then((value){
      check.checkLogin(token: value).then((value) {
        switch(value){
          case 200:
            Get.off(MainPage());
            break;
          case 201:
            Get.off(LoginPage());
            break;

          default:
            if(mounted){
              setState(() {
                error = true;
              });
            }
            break;

        }

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end:  Alignment.topCenter,
                    colors: [
                      Theme.of(context).primaryColorDark,
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor,
                    ]
                )
            ),
            child: Center(
              child: Image.asset('assets/image/icon.png',width: 150,height: 150,),
            ),
          ),
          error ?Container(
            decoration: BoxDecoration(
              color: Colors.black26.withOpacity(.6)
            ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.end ,
              children: [
                InkWell(
                  onTap: () {

                    if(mounted){
                      setState(() {
                        error = false;
                        _setTimer();
                      });
                    }
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 8),
                    width: Get.width,
                    child: Center(
                      child: Text(
                        "تلاش مجدد",
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ):Container(),
        ],

      ),
    );
  }

}
