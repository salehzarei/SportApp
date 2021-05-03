import 'package:get/get.dart';
import 'package:sportapplication/Model/DividerModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class AppFunction extends GetxController{

  final getDividerLoading = true.obs;
  DividerModel dividerModel;


  Future  getDivider() async {
    getDividerLoading.value = true;
    final response = await ApiService().getDivider();
    if (response.statusCode == 200) {
      dividerModel = DividerModel.fromJson(response.body);
      getDividerLoading.value = false;
    }
  }


}