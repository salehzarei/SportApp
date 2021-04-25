import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/PlanModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class PlanFunction extends GetxController {
  final planLoading = false.obs;
  final mypackLoading = false.obs;

  List<PlanData> planList = [];
  List<MypackagesModel> myPackagesList = [];
  //////دریافت لیست پلن ها
  Future getPlanList({@required String token}) async {
    planLoading.value = true;
    planList.clear();
    final response = await ApiService().getPlan(token: token);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body['data'];
      List<PlanData> pln =
          (responseData).map((i) => PlanData.fromJson(i)).toList();
      planList = pln;
      update();
      planLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    update();
    planLoading.value = false;
    print('planList');
    print(planList);
  }

  //////دریافت لیست بسته های من
  Future getMyPackagesList({@required String token}) async {
    mypackLoading.value = true;
    myPackagesList.clear();
    final response = await ApiService().getPlan(token: token);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body['data'];
      List<MypackagesModel> pln =
          (responseData).map((i) => MypackagesModel.fromJson(i)).toList();
      myPackagesList = pln;
      update();
      mypackLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    update();
    mypackLoading.value = false;
  }
}
