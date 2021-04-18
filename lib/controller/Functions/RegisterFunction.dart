import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Service/Request.dart';

import 'Controller.dart';

class RegisterFunction extends GetxController {
  final Controller os = Get.put(Controller());

  Map<dynamic, dynamic> ostanList = {};
  Map<dynamic, dynamic> cityList = {};
  final ostanLoding = false.obs;
  final cityLoding = false.obs;
  final registerLoading = false.obs;
  final checkLoginLoading = false.obs;
  final checkerror = false.obs;
  final verificationCode = ''.obs;
  final code = ''.obs;

  List<dynamic> errorMassages = [];
  TextEditingController mobile = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();

//// دریافت لیست استان ها و شهر ها

  void fetchCity(int ostan) {
    cityLoding.value = true;
    getPlaceData(os.ostanSelected.value).then((v) {
      cityLoding.value = false;
    });
  }

  Future getPlaceData([int ostanId = 0]) async {
    if (ostanId > 0) {
      cityList.clear();
    } else {
      ostanList.clear();
    }
    update();
    final response = await ApiService().getProvinceList(ostanId);
    if (response.statusCode == 200) {
      if (ostanId > 0) {
        cityList = response.body;
        // print(cityList);
      } else {
        ostanList = response.body;
        // print(ostanList);
      }
      update();
      return true;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
  }

  /////////ارسال اطلاعات کاربر برای ثبت نام
  Future sendRegisterData(
      String name,
      String mobile,
      String email,
      String code,
      String pass,
      String verificationToken,
      String ostan,
      String city,
      String sysApp,
      String lat,
      String long,
      String level,
      List interest,
      String inviteCode) async {
    errorMassages = [];
    registerLoading.value = true;
    final response = await ApiService().registerUser(
        name,
        mobile,
        email,
        code,
        pass,
        verificationToken,
        ostan,
        city,
        sysApp,
        lat,
        long,
        level,
        interest,
        inviteCode);
    checkerror.value = response.body['error'];
    // print('chekerror');
    // print(checkerror);
    if (response.statusCode == 200 && !checkerror.value) {
      // String _token = response.body['token'];
      // to.setToken(_token);
      update();
    } else {
      errorMassages = (response.body['error_msg'] is List)
          ? response.body['error_msg']
          : [response.body['error_msg']];
      // print('errorMassages');
      // print(errorMassages);
    }
    registerLoading.value = false;
  }

  /////////چک کردن شماره همراه
  Future checkMobile(String m) async {
    checkLoginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().checkPhone(m);
    checkerror.value = response.body['error'];
    // print('chekerror');
    // print(checkerror);
    if (response.statusCode == 200 && !checkerror.value) {
      // verificationCode.value = response.body['verification_token'];
      // checkregister.value = response.body['register'];
      // setRegisterCode(checkregister.value);
      // print('verificationCode');
      // print(verificationCode);
      // print('checkregister');
      // print(checkregister);
    } else {
      errorMassages = (response.body['error_msg'] is List)
          ? response.body['error_msg']
          : [response.body['error_msg']];
    }
    checkLoginLoading.value = false;
  }

////////ارسال شماره و دریافت کد احراز هویت
  Future getVerificationCode(String m) async {
    checkLoginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().verificationCode(m);
    checkerror.value = response.body['error'];
    // print('chekerror');
    // print(checkerror);
    if (response.statusCode == 200 && !checkerror.value) {
      verificationCode.value = response.body['verification_token'];
      // checkregister.value = response.body['register'];
      // setRegisterCode(checkregister.value);
      // print('verificationCode');
      // print(verificationCode);
      // print('checkregister');
      // print(checkregister);
    } else {
      errorMassages = (response.body['error_msg'] is List)
          ? response.body['error_msg']
          : [response.body['error_msg']];
    }
    checkLoginLoading.value = false;
  }
}
