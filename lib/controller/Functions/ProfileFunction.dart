import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/ProfileModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class ProfileFunction extends GetxController {
  UserDataModel userProfile;
  final profileLoading = true.obs;
  final editeProfileLoading = false.obs;
  final checkerror = false.obs;
  List<dynamic> errorMassages = [];

  Future loadingUserData({@required String tokens}) async {
    profileLoading.value = true;
    userProfile = null;
    final response = await ApiService().profileUserData(token: tokens);

    if (response.statusCode == 200) {
      userProfile = UserDataModel.fromJson(response.body);

      profileLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    update();
    notifyChildrens();
    // profileLoading.value = false;
  }

  Future sendEditProfileData({
     @required String token,
     @required String name,
     @required String tell,
     @required String email,
     @required String ostan,
     @required String city,
     @required String lat,
     @required String lng,
     @required List interest,
     @required List activityScope,
     @required File pic,
  }) async {
    errorMassages = [];
    editeProfileLoading.value = true;
    final response = await ApiService().editeProfileUser(
        lng: lng,
        name: name,
        tell: tell,
        email: email,
        interest: interest,
        token: token,
        pic: pic,
        lat: lat,
        city: city,
        activityScope:activityScope,
        ostan: ostan);
    if (response.statusCode == 200) {
      editeProfileLoading.value = false;
      bool error = response.body['error'];
      if(!error){
        print("200");
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
        editeProfileLoading.value = false;
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      editeProfileLoading.value = false;
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
  }

}
