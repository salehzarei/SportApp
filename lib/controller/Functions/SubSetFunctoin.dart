import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/SubSetModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class SubSetFunction extends GetxController{

  SubSetModel subSetModel;
  final loading = true.obs;
  final userSubsetLoading = true.obs;

  final addSubsetLoading = true.obs;

  int subset_id = 0;

  final deleteError = false.obs;
  List<dynamic> errorMassages = [];

  Future  getSubset(String token) async {
    loading.value = true;
    final response = await ApiService().subSet(token: token);
    if (response.statusCode == 200) {
      subSetModel =SubSetModel.fromJson(response.body);
      loading.value = false;
      update();
      notifyChildrens();
    } else {
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
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        update();
      }else{
        deleteError.value = true;
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        update();
      }
    } else {
      deleteError.value = true;
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
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        update();
      }else{
        deleteError.value = true;
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        update();
      }
    } else {
      deleteError.value = true;
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
    }
  }

  Future  addSubset(String token,String id) async {
    addSubsetLoading.value = true;
    final response = await ApiService().addSubset(token: token, id: id);
    if (response.statusCode == 200) {
      bool err = response.body['error'];
      if(!err){
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        // subset_id = response.body['id'];
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


}