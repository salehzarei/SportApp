import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/ProfileModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class ProfileFunction extends GetxController {
  UserDataModel userProfile;
  final profileLoading = true.obs;

  ////////// ارسال توکن و دریافت اطلاعات پروفایل کاربر
  Future loadingUserData({@required String token}) async {
    profileLoading.value = true;
    final response = await ApiService().profileUserData(token: token);
    if (response.statusCode == 200) {
      userProfile = UserDataModel.fromJson(response.body);
      profileLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    profileLoading.value = false;
  }
}
