import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/MyPlanListModel.dart';
import 'package:sportapplication/Model/PlanModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class PlanFunction extends GetxController {
  static PlanFunction get to => Get.find<PlanFunction>();
  final planLoading = false.obs;
  final mypackLoading = false.obs;

  String url="";
  int couponDiscount=0;

  List errorMassages = [];
  List<PlanData> planList = [];

  MyPlanListModel planModel;

  Future getPlanList({@required String token}) async {
    planLoading.value = true;
    planList.clear();
    final response = await ApiService().getPlan(token: token);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body['data'];
      List<PlanData> pln =
          (responseData).map((i) => PlanData.fromJson(i)).toList();
      planList = pln;
      planLoading.value = false;
    }
    update();
  }

  Future getMyPackagesList({@required String token}) async {
    mypackLoading.value = true;
    final response = await ApiService().myPlans(token: token);
    if (response.statusCode == 200) {
      planModel = MyPlanListModel.fromJson(response.body);
      mypackLoading.value = false;
    }
    update();
  }

  Future checkCoupon({
    @required String token,
    @required String plan_id,
    @required String coupon}) async {
    errorMassages.clear();
    final response = await ApiService().checkCoupon(token: token, coupon: coupon, plan_id: plan_id);
    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        couponDiscount = response.body['coupon']['discount'];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["?????? ???? ?????????????? ???????????? ???? ????????"];
      return 400;
    }
  }

  Future buyPlan({@required String token, @required String plan_id,@required String paymentType, String coupon}) async {
    errorMassages.clear();
    final response = await ApiService().buyPlan(token: token, paymentType: paymentType, coupon: coupon, plan_id: plan_id);
    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        url = response.body['url'];

        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        return 201;
      }
    } else {
      errorMassages = ["?????? ???? ?????????????? ???????????? ???? ????????"];
      return 400;
    }
  }

}
