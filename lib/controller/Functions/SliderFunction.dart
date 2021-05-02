import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/SliderModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class SliderFunction extends GetxController {

  List<SliderModel> sliderList = [];

  //////دریافت اسلایدر
  Future <List<SliderModel>> getSlider() async {
    sliderList.clear();
    final response = await ApiService().getSlider();
    if (response.statusCode == 200) {
      print('response.body');
      print(response.body);
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