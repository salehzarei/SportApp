import 'package:get/get.dart';

class ApiService extends GetConnect {
  final String apiUrl = 'http://192.168.1.3/np-framework/sportplus/api';

  ////////دریافت لیست استان و شهر
  Future<Response> getProvinceList(int ostanid) =>
      get(apiUrl + '/user/getplace?ostan=${ostanid.toString()}');
}
