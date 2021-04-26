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

  ////////// ارسال توکن و دریافت اطلاعات پروفایل کاربر
  Future loadingUserData({@required String tokens}) async {
    profileLoading.value = true;
    final response = await ApiService().profileUserData(token: tokens);
    if (response.statusCode == 200) {
      userProfile = UserDataModel.fromJson(response.body);
      print(response.body);
      update();
      profileLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    profileLoading.value = false;
  }

  /////////ویرایش پروفایل
  Future sendEditeProfileData({
    String token,
    String name,
    String tell,
    String email,
    String ostan,
    String city,
    int lat,
    int lng,
    List interest,
    List activityScope,
    String pic,
  }) async {
    errorMassages = [];
    editeProfileLoading.value = true;
    final response = await ApiService().editeProfileUser();
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
