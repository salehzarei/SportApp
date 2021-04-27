import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  final String apiUrl = 'http://192.168.1.3/np-framework/sportplus/api/';

  ////////دریافت لیست استان و شهر
  Future<Response> getProvinceList(int ostanid) =>
      get(apiUrl + 'user/getplace?ostan=${ostanid.toString()}');

////////ارسال توکن و دریافت اطلاعات کاربر
  Future<Response> profileUserData({@required String token}) =>
      post(apiUrl + 'profile', FormData({'token': token}));

  ////////ارسال اطلاعات ثبت نام
  Future<Response> registerUser(
          String name,
          String mobile,
          String email,
          String code,
          String pass,
          String verificationToken,
          int ostan,
          int city,
          String sysApp,
          String lat,
          String long,
          int level,
          List interest,
          List acivityScope,
          String inviteCode) =>
      post(
          apiUrl + 'user/register',
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
            'lng': long,
            'level': level,
            'interest': json.encode(interest),
            'activity_scope': json.encode(acivityScope),
            'invite_code': inviteCode,
          }));

  ////////ارسال اطلاعات ویرایش پروفایل
  Future<Response> editeProfileUser({
    String token,
    String name,
    String tell,
    String email,
    String ostan,
    String city,
    int lat,
    int lng,
    List interest,
    List activityScope,
    String pic,
  }) =>
      post(
          apiUrl + 'profile/edit',
          FormData({
            'token': token,
            'name': name,
            'tell': tell,
            'email': email,
            'ostan': ostan,
            'city': city,
            'lat': lat,
            'lng': lng,
            'interest': json.encode(interest),
            'activity_scope': json.encode(activityScope),
            'pic': pic,
          }));

////////چک کردن شماره همراه
  Future<Response> checkPhone(String mobile) =>
      post(apiUrl + 'user/checkmobile', FormData({'mobile': mobile}));

////////ارسال شماره و دریافت کد احراز هویت
  Future<Response> verificationCode(String mobile) =>
      post(apiUrl + 'user/getVerificationCode', FormData({'mobile': mobile}));

////////ارسال شماره و کد احراز هویت برای درست یا نادرست بودن کد احراز
  Future<Response> checkVerificationCode(
          String mobile, String code, String vcode) =>
      post(
          apiUrl + 'user/checkVerificationCode',
          FormData(
              {'mobile': mobile, 'code': code, 'verification_token': vcode}));

////////ارسال شماره و کد احراز هویت برای درست یا نادرست بودن کد احراز
  Future<Response> login({@required String mobile, @required String pass}) =>
      post(
          apiUrl + 'user/login',
          FormData({
            'mobile': mobile,
            'pass': pass,
          }));

////////ارسال لول و دریافت دسته بندی های هر عنوان شغلی
  Future<Response> getCategoryAccountType(int level) =>
      get(apiUrl + 'category?level=${level.toString()}');


////////ارسال لول و دریافت دسته بندی های هر عنوان شغلی
  Future<Response> removePackage(String token,String pId) =>
      post(apiUrl + 'providerpackage/delete?token=$token', FormData({
        'proId': pId,
      }));


//حذف مقالات
  Future<Response> removeArticle(String token,String pId) =>
      post(apiUrl + 'providerblog/delete?token=$token', FormData({
        'proId': pId,
      }));

////////چک کردن لاگین بودن کاربر
  Future<Response> checkLogin({@required String token}) =>
      get(apiUrl + 'user/checkLogin?token=$token');

  //////دریافت لیست پلن ها
  Future<Response> getPlan({@required String token}) =>
      get(apiUrl + 'plans?token=$token');

  //////دریافت لیست پکیح های من
  Future<Response> getMyPackage({@required String token}) =>
      get(apiUrl + 'providerpackage?token=$token&page=&limit=&catId=&word');

  ////اد کردن پکیج توسط کاربران مجاز
  Future<Response> addPackage(
          {@required String token,
          @required String title,
          @required String description,
          @required String category,
          @required List pics,
          @required String price,
          @required String discount,
          @required String discount_type,
          @required String sdate,
          @required String edate}) =>
      post(
          apiUrl + 'providerpackage/add?token=$token',
          FormData({
            'title': title,
            'description': description,
            'category': category,
            'pics': json.encode(pics),
            'price': price,
            'discount': discount,
            'discount_type': discount_type,
            'sdate': sdate,
            'edate': edate,
          }));

  ////اد کردن مقاله توسط کاربران مجاز
  Future<Response> addArticle(
          {@required String token,
          @required String title,
          @required String description,
          @required String category,
          @required List pics,
          @required List tags,
          @required String summary}) =>
      post(
          apiUrl + 'providerblog/add?token=$token',
          FormData({
            'title': title,
            'description': description,
            'category': category,
            'pics': json.encode(pics),
            'tags': json.encode(tags),
            'summary': summary,
          }));


  //// مقالهای کاربران مجاز
  Future<Response> articleList(
          {@required String token,
          @required String page,
          @required String limit,
          @required String catId,
          @required String word}) =>
      get(apiUrl + 'providerblog?token=$token&page=$page&limit=$limit&catId=$catId&word=$word',);


  ////آپلود عکس پکیج
  Future<Response> uploadProductPic(
          {@required String token, @required File pic}) =>
      post(
          apiUrl + 'providerpackage/uplaodPic',
          FormData({
            'token': token,
            'file': MultipartFile(
              pic,
              filename: pic.path.split('/').last,
            ),
          }));

 // لیست زیر مجموعه ها
  Future<Response> subSet(
          {@required String token,}) =>
      post(apiUrl + 'profile/subset',
          FormData({
            'token': token,
          }));

 // حذف از زیر مجموعه ها
  Future<Response> deleteSubset(
          {@required String token,@required String id,}) =>
      post(apiUrl + 'profile/deletesubset',
          FormData({
            'token': token,
            'id': id,
          }));

// قبول از زیر مجموعه ها
  Future<Response> acceptSubset( {@required String token,@required String id,}) =>
      post(apiUrl + 'profile/acceptsubset',
          FormData({
            'token': token,
            'id': id,
          }));


// قبول از زیر مجموعه ها
  Future<Response> showPackage(String token, String id) =>
      get(apiUrl + 'providerpackage/show?proId=$id&token=$token');



//لیست پروایدر ها
  Future<Response> providers(String token, String level, String folowing, String special, String activity_scope) =>
      get(apiUrl + 'providers?token=$token&word=&level=$level&following=$folowing&special=$special&activity_scope=$activity_scope');


//انفالو پروایدر ها
  Future<Response> unfollow(String token, String id) =>
      post(apiUrl + 'providers/unfollow',FormData({
        'token': token,
        'id': id,
      }));


  ////  اسلایدر
  Future<Response> getSlider() => get(apiUrl + 'slider');
}
