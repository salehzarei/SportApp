import 'package:get/get.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class ProfileFunctions extends GetxController {
  final ostanSelected = 0.obs;
  final citySelected = 0.obs;
  final ostanLoding = false.obs;
  final cityLoding = false.obs;
  Map<dynamic, dynamic> ostanList = {};
  Map<dynamic, dynamic> cityList = {};

  //// دریافت لیست استان ها و شهر ها

  void fetchCity(int ostan) {
    cityLoding.value = true;
    getPlaceData(ostanSelected.value).then((v) {
      cityLoding.value = false;
    });
  }

  Future getPlaceData([int ostanId = 0]) async {
    if (ostanId > 0) {
      cityList.clear();
    } else {
      ostanList.clear();
    }
    update();
    final response = await ApiService().getProvinceList(ostanId);
    if (response.statusCode == 200) {
      if (ostanId > 0) {
        cityList = response.body;
      } else {
        ostanList = response.body;
      }
      update();
      return true;
    } else {
      // Constans().dialogboxCheckInternet(response.statusCode);
    }
  }
}
