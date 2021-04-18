import 'package:get/get.dart';

class ApiService extends GetConnect {
  final String apiUrl = 'http://192.168.1.3/np-framework/sportplus/api';

  ////////دریافت لیست استان و شهر
  Future<Response> getProvinceList(int ostanid) =>
      get(apiUrl + '/user/getplace?ostan=${ostanid.toString()}');

  ////////ارسال اطلاعات ثبت نام
  Future<Response> registerUser(
          String name,
          String mobile,
          String email,
          String code,
          String pass,
          String verificationToken,
          String ostan,
          String city,
          String sysApp,
          String lat,
          String long,
          String level,
          List interest,
          String inviteCode) =>
      post(
          apiUrl + '/user/register',
          FormData({
            'name': name,
            'mobile': mobile,
            'email': email,
            'code': code,
            'pass': pass,
            'verification_token': verificationToken,
            'ostan': ostan,
            'city': city,
            'sysApp': sysApp,
            'lat': lat,
            'long': long,
            'level': level,
            'interest': interest,
            'invite_code': inviteCode,
          }));

////////چک کردن شماره همراه
  Future<Response> checkPhone(String mobile) =>
      post(apiUrl + '/user/checkmobile', FormData({'mobile': mobile}));

////////ارسال شماره و دریافت کد احراز هویت
  Future<Response> verificationCode(String mobile) =>
      post(apiUrl + '/user/getVerificationCode', FormData({'mobile': mobile}));

////////ارسال شماره و کد احراز هویت برای درست یا نادرست بودن کد احراز
  Future<Response> checkVerificationCode(String mobile, String code) => post(
      apiUrl + '/user/checkVerificationCode',
      FormData({
        'mobile': mobile,
        'code': code,
      }));

////////ارسال لول و دریافت دسته بندی های هر عنوان شغلی
  Future<Response> getCategoryAccountType(int level) =>
      get(apiUrl + '/category?level=${level.toString()}');
}
