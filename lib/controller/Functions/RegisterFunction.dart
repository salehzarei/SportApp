import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/CategoryAccountTypeModel.dart';
import 'package:sportapplication/Model/providerModel.dart';
import 'package:sportapplication/Model/showProviderModel.dart';
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

  final showProviderLoading = true.obs;

  final cityLoding = false.obs;
  final registerLoading = false.obs;
  final checkLoginLoading = false.obs;
  final loginLoading = false.obs;
  final providerLoading = true.obs;
  final checkerror = false.obs;
  final resetPassLoading = false.obs;
  final verificationCode = ''.obs;
  final code = ''.obs;
  List<CategoryAccountTypeModel> categoryList = [];
  List<CategoryAccountTypeModel> interestList = [];

  ProviderModel providerList ;
  ShowProviderModel showProviderModel ;

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

  Future sendRegisterData(
      {String name,
      String mobile,
      String email,
      String address,
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
      List acivityScope,
      String inviteCode}) async {
    errorMassages = [];
    registerLoading.value = true;
    final response = await ApiService().registerUser(
        name,
        mobile,
        email,
        code,
        pass,
        address,
        verificationToken,
        ostan,
        city,
        sysApp,
        lat,
        long,
        level,
        interest,
        acivityScope,
        inviteCode);
    checkerror.value = response.body['error'];
    // print('chekerror');
    // print(checkerror);
    if (response.statusCode == 200 && !checkerror.value) {
      // String _token = response.body['token'];
      saveShared("token", response.body['token'].toString());
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
    if (response.statusCode == 200) {
      checkerror.value = response.body['error'];
      print(response.body['error']);
      checkLoginLoading.value = false;
      if (!checkerror.value) {
        return 200;
      } else {
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
  Future<int> login({@required String mobile, @required String pass}) async {
    loginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().login(pass: pass, mobile: mobile);
    if (response.statusCode == 200) {
      checkerror.value = response.body['error'];
      if (!checkerror.value) {
        saveShared("token", response.body['token'].toString());
        saveShared("active", response.body['active'].toString());
        return 200;
      } else {
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

  Future resetPass({@required String mobile, @required String code,@required String pass,@required String verification_token})async {

    resetPassLoading.value = true;
    errorMassages.clear();

    final response = await ApiService().resetPass(verification_token: verification_token,code: code,mobile: mobile,pass: pass);

    if (response.statusCode == 200) {
      bool err = response.body['error'];
      if(!err){
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }

  }

  //////دریافت لیست دسته بندی ها
  Future getProductCategories(int level) async {
    categoryLoading.value = true;
    categoryList.clear();
    interestList.clear();

    final response = await ApiService().getCategoryAccountType(level);
    final response2 = await ApiService().getCategoryAccountType(0);

    if (response.statusCode == 200 && response2.statusCode == 200) {
      final List<dynamic> responseData = response.body['post'];
      final List<dynamic> responseData2 = response2.body['post'];
      List<CategoryAccountTypeModel> cat = (responseData)
          .map((i) => CategoryAccountTypeModel.fromJson(i))
          .toList();
      categoryList = cat;
      List<CategoryAccountTypeModel> cat2 = (responseData2)
          .map((i) => CategoryAccountTypeModel.fromJson(i))
          .toList();
      interestList = cat2;
      update();
      categoryLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    update();
    categoryLoading.value = false;
    print('Category List account Type');
    print(interestList);
  }

  Future providers(
      {@required String token,
       @required String level,
       @required String following,
       @required String special,
       @required String activity_scope,
  }) async {
    providerLoading.value = true;
    final response = await ApiService().providers(token , level , following,special,activity_scope);

    if (response.statusCode == 200) {
      print("count of list");
      print(response.body);

      providerList = ProviderModel.fromJson(response.body);
      providerLoading.value = false;
      update();
      notifyChildrens();
    } else {
      providerLoading.value = true;
      update();
      notifyChildrens();
    }

  }
// نمایش پرووایدر ها
  Future showProvider(
      {@required String token,
       @required String bId }) async {
    showProviderLoading.value = true;
    final response = await ApiService().showProvider(token , bId);
    if (response.statusCode == 200) {
      print(response.body);
      showProviderModel = ShowProviderModel.fromJson(response.body);
      showProviderLoading.value = false;
      update();
      notifyChildrens();
    } else {
      showProviderLoading.value = true;
      update();
      notifyChildrens();
    }
  }

 // آنفالو کردن پروایدر
  Future unFollow(String token , String id) async {
    final response = await ApiService().unfollow(token , id );
    if (response.statusCode == 200) {
      checkerror.value = response.body['error'];
      if( checkerror.value){
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
      }else{
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
      }
      update();
    } else {
      checkerror.value  = true;
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      update();
    }

  }

 // فالو کردن پروایدر
  Future follow(String token , String id) async {
    final response = await ApiService().follow(token , id );
    if (response.statusCode == 200) {
      checkerror.value = response.body['error'];
      if( checkerror.value){
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
      }else{
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
      }
      update();
    } else {
      checkerror.value  = true;
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      update();
    }

  }

}
