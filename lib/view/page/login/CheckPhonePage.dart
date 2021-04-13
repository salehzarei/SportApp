import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/component/Constans.dart';

import 'VerificationCodePage.dart';

class CheckPhonePage extends StatelessWidget {
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
          body: Padding(
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
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(VerificationCodePage());
                    },
                    child: Text(
                      'دریافت کد',
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
