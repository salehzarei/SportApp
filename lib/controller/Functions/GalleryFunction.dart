import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/MyGalleryModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class GalleryFunction extends GetxController{
  static GalleryFunction get to => Get.find<GalleryFunction>();

  final showMyGalleryLoading = true.obs;
  MyGalleryModel showGalleryModel;

  List errorMassages = [];


  Future getMyGallery({@required String token}) async {
    showMyGalleryLoading.value = true;
    final response = await ApiService().getMyGallery(token);
    if (response.statusCode == 200) {
      showMyGalleryLoading.value = false;
      showGalleryModel = MyGalleryModel.fromJson(response.body);
      }
    update();
  }

  Future<int> removeGallery(
      {@required String token,
       @required String proId}) async {

    errorMassages.clear();

    final response = await ApiService().removeGallery(token, proId);

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


  Future<int> addGallery(
      {@required String token,
       @required String title,
       @required File pic}) async {

    errorMassages.clear();

    final response = await ApiService().addGallery(token , title,pic);

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


}