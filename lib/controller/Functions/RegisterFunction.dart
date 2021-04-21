import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/CategoryAccountTypeModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';
import 'package:sportapplication/controller/util.dart';

import '../util.dart';
import 'Controller.dart';

class RegisterFunction extends GetxController {
  final Controller os = Get.put(Controller());

  Map<dynamic, dynamic> ostanList = {};
  Map<dynamic, dynamic> cityList = {};
  final ostanLoding = false.obs;
  final categoryLoading = false.obs;

  final cityLoding = false.obs;
  final registerLoading = false.obs;
  final checkLoginLoading = false.obs;
  final loginLoading = false.obs;
  final checkerror = false.obs;
  final verificationCode = ''.obs;
  final code = ''.obs;
  List<CategoryAccountTypeModel> categoryList = [];

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
      {String name,
      String mobile,
      String email,
      String code,
      String pass,
      String verificationToken,
      int ostan,
      int city,
      String sysApp,
      String lat,
      String long,
      int level,
      List interest,
      String inviteCode}) async {
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
      String _token = response.body['token'];
      saveShared('token', _token);
      errorMassages = (response.body['report_msg'] is List)
          ? response.body['report_msg']
          : [response.body['report_msg']];
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

  /////////چک کردن لاگین بودن
  Future<int> checkLogin({@required String token}) async {
    checkLoginLoading.value = true;
    final response = await ApiService().checkLogin(token: token);
    if (response.statusCode == 200 ) {
      checkerror.value = response.body['error'];
      print(response.body['error']);
      checkLoginLoading.value = false;
      if(!checkerror.value){
        return 200;
      }else{
        return 201;
      }
    } else {
      checkLoginLoading.value = false;
     return 400;
    }

  }

////////ارسال شماره و کد احراز هویت برای درست یا نادرست بودن کد احراز
  Future checkVerificationCodes(String mobile, String code) async {
    // checkLoginLoading.value = true;
    errorMassages = [];
    final response = await ApiService()
        .checkVerificationCode(mobile, code, verificationCode.value);
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
    // checkLoginLoading.value = false;
  }

////////ارسال شماره و کد احراز هویت برای درست یا نادرست بودن کد احراز
  Future<int> login({@required String mobile,@required String pass}) async {
    loginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().login(pass: pass, mobile: mobile);
    if (response.statusCode == 200) {
      checkerror.value = response.body['error'];
      if(!checkerror.value){
          saveShared("token", response.body['token'].toString());
          saveShared("active", response.body['active'].toString());
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print(errorMassages);
        print(errorMassages.length);
        print(errorMassages[0]);
        return 201;
      }
    } else {

      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    // checkLoginLoading.value = false;
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
      // print(verificationCode.value);
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

  //////دریافت لیست دسته بندی ها
  Future getProductCategories(int level) async {
    categoryLoading.value = true;
    categoryList.clear();
    final response = await ApiService().getCategoryAccountType(level);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body['post'];
      List<CategoryAccountTypeModel> cat = (responseData)
          .map((i) => CategoryAccountTypeModel.fromJson(i))
          .toList();
      categoryList = cat;
      update();
      categoryLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    update();
    categoryLoading.value = false;
    print('Category List account Type');
    print(categoryList);
  }
}
