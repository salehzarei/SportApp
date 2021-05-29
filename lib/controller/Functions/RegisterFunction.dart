import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/CategoryAccountTypeModel.dart';
import 'package:sportapplication/Model/UpdateModel.dart';
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
  final mobile = ''.obs;
  final code = ''.obs;
  List<CategoryAccountTypeModel> categoryList = [];

  ProviderModel providerList ;
  ShowProviderModel showProviderModel ;
  UpdateModel updateModel ;

  List<dynamic> errorMassages = [];



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
      } else {
        ostanList = response.body;
      }
      update();
      return true;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
  }

  Future sendRegisterData(
      {
     @required String name,
     @required String mobile,
     @required String email,
     @required String address,
     @required String code,
     @required String pass,
     @required String verificationToken,
     @required int ostan,
     @required int city,
     @required String sysApp,
     @required String lat,
     @required String long,
     @required int level,
     @required List interest,
     @required String firebase_token,
     @required List acivityScope,
     @required String inviteCode}) async {
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
        firebase_token,
        acivityScope,
        inviteCode);
    if (response.statusCode == 200) {
      bool err = response.body['error'];
      if(!err){
        saveShared("token", response.body['token'].toString());
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

  Future checkMobile(String m) async {
    checkLoginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().checkPhone(m);
    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];

        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

  Future<int> checkLogin({@required String token}) async {
    checkLoginLoading.value = true;
    final response = await ApiService().checkLogin(token: token);
    if (response.statusCode == 200) {
      checkerror.value = response.body['error'];
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

  Future<UpdateModel> checkUpdate() async {
    final response = await ApiService().checkUpdate();
    if (response.statusCode == 200 ) {
      updateModel = UpdateModel.fromJson(response.body);
      return updateModel;
    } else {
      checkLoginLoading.value = false;
      return null;
    }
  }

  Future checkVerificationCodes(String code) async {
    errorMassages = [];
    final response = await ApiService()
        .checkVerificationCode(mobile.value, code, verificationCode.value);
    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

  Future<int> login({@required String mobile, @required String pass, @required String firebase_token}) async {
    loginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().login(pass: pass, mobile: mobile, firebase_token: firebase_token);
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
        return 201;
      }
    } else {
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    // checkLoginLoading.value = false;
  }

  Future getVerificationCode(String m) async {
    checkLoginLoading.value = true;
    errorMassages = [];
    final response = await ApiService().verificationCode(m);
    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        verificationCode.value = response.body['verification_token'];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

  Future resetPass({@required String mobile, @required String code,@required String pass,@required String verification_token})async {

    resetPassLoading.value = true;
    errorMassages.clear();

    final response = await ApiService().resetPass(verification_token: verification_token,code: code,mobile: mobile,pass: pass);

    if (response.statusCode == 200) {
      bool err = response.body['error'];
      if(!err){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }

  }

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
    }
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

  Future showProvider(
      {@required String token,
       @required String bId }) async {
    showProviderLoading.value = true;
    final response = await ApiService().showProvider(token , bId);
    if (response.statusCode == 200) {
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
