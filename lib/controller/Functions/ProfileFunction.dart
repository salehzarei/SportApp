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
    final response = await ApiService().profileUserData(token: tokens);

    print('loadingUserData response.body');
    print(response.body);

    if (response.statusCode == 200) {
      userProfile = UserDataModel.fromJson(response.body);
      print(response.body);
      update();
      profileLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    // profileLoading.value = false;
  }

  Future sendEditeProfileData({
   @required String token,
   @required String name,
   @required String tell,
   @required String email,
   @required String ostan,
   @required String city,
   @required int lat,
   @required int lng,
   @required List interest,
   @required List activityScope,
   @required String pic,
  }) async {
    errorMassages = [];
    editeProfileLoading.value = true;
    final response = await ApiService().editeProfileUser(lng: lng, name: '', tell: '', email: '', interest: [], token: '', pic: null, lat: null, city: '', activityScope: [], ostan: '');
    checkerror.value = response.body['error'];
    if (response.statusCode == 200 && !checkerror.value) {
      errorMassages = response.body['report_msg'];
    } else {
      errorMassages = (response.body['error_msg'] is List)
          ? response.body['error_msg']
          : [response.body['error_msg']];
    }
    editeProfileLoading.value = false;
  }

}
