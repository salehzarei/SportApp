import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/AboutModel.dart';
import 'package:sportapplication/Model/SliderModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class SliderFunction extends GetxController {

  List<SliderModel> sliderList = [];

  final aboutLoading = true.obs;
  AboutModel aboutModel;

  final rulesLoading = true.obs;
  AboutModel rulesModel;

  //////دریافت اسلایدر
  Future <List<SliderModel>> getSlider() async {
    sliderList.clear();
    final response = await ApiService().getSlider();
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.body;
      List<SliderModel> sld = (responseData)
          .map((i) => SliderModel.fromJson(i))
          .toList();
      sliderList=sld;
      update();
      return sliderList;
    } else {
      update();
      return sliderList;
    }
  }

  Future  about() async {
    aboutLoading.value = true;
    final response = await ApiService().about();
    if (response.statusCode == 200) {
      aboutModel = AboutModel.fromJson(response.body);
      aboutLoading.value = false;
    }
    update();
  }

  Future  rules() async {
    rulesLoading.value = true;
    final response = await ApiService().rules();
    if (response.statusCode == 200) {
      rulesModel = AboutModel.fromJson(response.body);
      rulesLoading.value = false;
    }
    update();
  }

  Future <String> getAddress({@required String lat ,@required String lng }) async {
    sliderList.clear();
    final response = await ApiService().getAddress(lat, lng);
    if (response.statusCode == 200) {
      return response.body['postal_address'];
    } else {
      return "مشکل در ارتباط با سرور نقشه";
    }
  }
}