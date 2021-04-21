import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/PlanModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class PlanFunction extends GetxController{

  final planLoading = false.obs;
  List<PlanData> planList = [];

  //////دریافت لیست پلن ها
  Future getPlanList({@required String token}) async {
    planLoading.value = true;
    planList.clear();
    final response = await ApiService().getPlan(token: token);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body['data'];
      List<PlanData> pln = (responseData)
          .map((i) => PlanData.fromJson(i))
          .toList();
      planList = pln;
      update();
      planLoading.value = false;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
    update();
    planLoading.value = false;
  }

}