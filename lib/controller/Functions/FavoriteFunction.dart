import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class FavoriteFunction  extends GetxController{

  List errorMassages = [];
  int id;

  Future addFavorite(
      {@required String token,
        @required String proId}) async {

    errorMassages.clear();
    final response = await ApiService().addFav(
        token: token, proId: proId,
    );

    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        id = response.body['id'];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    update();
  }

  Future removeFav(
      { @required String token,
        @required String proId}) async {

    errorMassages.clear();
    final response = await ApiService().removeFav(
        token: token, proId: proId,
    );

    if (response.statusCode == 200) {
      bool error = response.body['error'];
      if(!error){
        print("200");
        errorMassages = (response.body['report_msg'] is List)
            ? response.body['report_msg']
            : [response.body['report_msg']];
        return 200;
      }else{
        errorMassages = (response.body['error_msg'] is List)
            ? response.body['error_msg']
            : [response.body['error_msg']];
        print("201");
        return 201;
      }
    } else {
      print("400");
      errorMassages = ["خطا در برقراری ارتباط با سرور"];
      return 400;
    }
    update();
  }

}