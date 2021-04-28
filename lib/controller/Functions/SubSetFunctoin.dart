import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/SubSetModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class SubSetFunction extends GetxController{

  SubSetModel subSetModel;
  final loading = true.obs;
  final userSubsetLoading = true.obs;
  final deleteError = false.obs;
  List<dynamic> errorMassages = [];

  Future  getSubset(String token) async {
    loading.value = true;
    final response = await ApiService().subSet(token: token);
    if (response.statusCode == 200) {
      print("getSubset");
      print("200");
      subSetModel =SubSetModel.fromJson(response.body);
      loading.value = false;
      update();
      notifyChildrens();
    } else {
      print("getSubset");
      print("200");
      loading.value = true;
      update();
      notifyChildrens();
    }
  }

  Future  getUserSubset({@required String token,@required String uId}) async {
    userSubsetLoading.value = true;
    final response = await ApiService().userSubSet(token: token, uId: uId);
    if (response.statusCode == 200) {
      subSetModel =SubSetModel.fromJson(response.body);
      userSubsetLoading.value = false;
    } else {
      userSubsetLoading.value = true;
    }
    update();
    notifyChildrens();
  }

  Future  deleteSubset(String token,String id) async {
    deleteError.value = false;
    final response = await ApiService().deleteSubset(token: token, id: id);
    if (response.statusCode == 200) {
      deleteError.value = response.body['error'];
      if(!deleteError.value){
        deleteError.value = false;
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        update();
      }else{
        deleteError.value = true;
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        update();
      }
    } else {
      deleteError.value = true;
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
    }
  }

  Future  acceptSubset(String token,String id) async {
    deleteError.value = false;
    final response = await ApiService().acceptSubset(token: token, id: id);
    if (response.statusCode == 200) {
      deleteError.value = response.body['error'];
      if(!deleteError.value){
        deleteError.value = false;
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        update();
      }else{
        deleteError.value = true;
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        update();
      }
    } else {
      deleteError.value = true;
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
    }
  }


}