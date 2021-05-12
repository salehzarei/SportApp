import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  final String apiUrl = 'http://192.168.1.3/np-framework/sportplus/api/';

  Future<Response> getProvinceList(int ostanid) =>
      get(apiUrl + 'user/getplace?ostan=${ostanid.toString()}');

  Future<Response> profileUserData({@required String token}) =>
      post(apiUrl + 'profile', FormData({'token': token}));

  Future<Response> registerUser(
          String name,
          String mobile,
          String email,
          String code,
          String pass,
          String address,
          String verificationToken,
          int ostan,
          int city,
          String sysApp,
          String lat,
          String long,
          int level,
          List interest,
         String firebase_token,
          List acivityScope,
          String inviteCode) =>
      post( apiUrl + 'user/register', FormData({
            'name': name,
            'mobile': mobile,
            'email': email,
            'code': code,
            'pass': pass,
            'address': address,
            'verification_token': verificationToken,
            'ostan': ostan,
            'city': city,
            'sysApp': 'android',
            'lat': lat,
            'lng': long,
            'level': level,
            'interest': json.encode(interest),
            'activity_scope': json.encode(acivityScope),
            'invite_code': inviteCode,
            'firebase_token': firebase_token,
          }));


  Future<Response> editeProfileUser({
    @required String token,
    @required String name,
    @required String tell,
    @required String email,
    @required String ostan,
    @required String city,
    @required String lat,
    @required String lng,
    @required List interest,
    @required List activityScope,
    @required File pic,
  }) =>post(apiUrl + 'profile/edit',FormData({
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
            'pic':  MultipartFile(
                pic,
                filename: pic.path.split('/').last,
                ),
          }));

  Future<Response> checkPhone(String mobile) =>
      post(apiUrl + 'user/checkmobile', FormData({'mobile': mobile}));

  Future<Response> verificationCode(String mobile) =>
      post(apiUrl + 'user/getVerificationCode', FormData({'mobile': mobile}));

  Future<Response> checkVerificationCode(
          String mobile, String code, String vcode) =>
      post(
          apiUrl + 'user/checkVerificationCode',
          FormData(
              {'mobile': mobile, 'code': code, 'verification_token': vcode}));

  Future<Response> login({@required String mobile, @required String pass, @required String firebase_token}) =>
      post(
          apiUrl + 'user/login',
          FormData({
            'mobile': mobile,
            'pass': pass,
            'firebase_token': firebase_token,
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

  Future<Response> checkUpdate() =>
      get(apiUrl + 'app/update');

  //////دریافت لیست پلن ها
  Future<Response> getPlan({@required String token}) =>
      get(apiUrl + 'plans?token=$token');

  Future<Response> myPlans({@required String token}) =>
      get(apiUrl + 'plans/myPlans?token=$token');

  //////دریافت لیست پکیح های من
  Future<Response> getMyPackage({@required String token}) =>
      get(apiUrl + 'providerpackage?token=$token&page=&limit=&catId=&word');

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


  Future<Response> editPackage(
      {@required String token,
        @required String title,
        @required String proId,
        @required String description,
        @required String category,
        @required List pics,
        @required String price,
        @required String discount,
        @required String discount_type,
        @required String sdate,
        @required String edate}) =>
      post(
          apiUrl + 'providerpackage/edit?token=$token',
          FormData({
            'proId': proId,
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

  Future<Response> editArticle(
      {@required String token,
        @required String proId,
        @required String title,
        @required String description,
        @required String category,
        @required List pics,
        @required List tags,
        @required String summary}) =>
      post(
          apiUrl + 'providerblog/edit?token=$token',
          FormData({
            'proId': proId,
            'title': title,
            'description': description,
            'category': category,
            'pics': json.encode(pics),
            'tags': json.encode(tags),
            'summary': summary,
          }));


  Future<Response> articleList(
          {@required String token,
          @required String page,
          @required String limit,
          @required String catId,
          @required String word}) =>
      get(apiUrl + 'providerblog?token=$token&page=$page&limit=$limit&catId=$catId&word=$word',);

  Future<Response> checkCoupon({
           @required String token,
           @required String plan_id,
           @required String coupon
          }) =>post(apiUrl + 'plans/checkCoupon?token=$token', FormData({'plan_id': plan_id,'coupon': coupon,}));

  Future<Response> addFavPackage({
           @required String token,
           @required String proId
          }) =>post(apiUrl + 'package/favorit', FormData({'token': token,'id': proId,}));

  Future<Response> removeFavPackage({
           @required String token,
           @required String proId
          }) =>post(apiUrl + 'package/unfavorit', FormData({'token': token,'id': proId,}));

  Future<Response> addFavBlog({
           @required String token,
           @required String proId
          }) =>post(apiUrl + 'blog/favorit', FormData({'token': token,'id': proId,}));

  Future<Response> removeFavBlog({
           @required String token,
           @required String proId
          }) =>post(apiUrl + 'blog/unfavorit', FormData({'token': token,'id': proId,}));

  Future<Response> showBlog(
          {@required String token,
           @required String bId}) =>
      get(apiUrl + 'blog/show?bId=$bId&token=$token');

  Future<Response> showPBlog(
          {@required String token,
           @required String bId}) =>
      get(apiUrl + 'providerblog/show?proId=$bId&token=$token');

  Future<Response> userArticleList(
          {@required String token,
          @required String page,
          @required String limit,
          @required String catId,
          @required String tag,
          @required String uid,
          @required String sort,
          @required String folowing,
          @required String order,
          @required String interest,
          @required String word}) =>
      get(apiUrl + 'blog?catId=$catId&word=$word&tag=$tag&uid=$uid&sort=$sort&order=$order'
          '&page=$page&limit=$limit&interest=$interest&token=$token&folowing=$folowing');


  Future<Response> getPackage({
    @required String token,
    @required String catId,
    @required String word,
    @required String uid,
    @required String sort,
    @required String order,
    @required String limit,
    @required String interest,
    @required String level,
    @required String page,
    @required String special,
    @required String folowing,
    @required String favorite,
    @required String asc}) =>
      get(apiUrl + 'package?catId=$catId&word=$word&uid=$uid&sort=$sort&asc=$asc&order=$order&page=$page&limit=$limit&interest=$interest&token=$token&special=$special&folowing=$folowing&favorit=$favorite&level=$level');

  Future<Response> getBlog({
    @required String token,
    @required String catId,
    @required String word,
    @required String uid,
    @required String sort,
    @required String order,
    @required String limit,
    @required String interest,
    @required String page,
    @required String tag,
    @required String folowing,
    @required String favorite,
    @required String asc}) =>
      get(apiUrl + 'blog?catId=$catId&word$word&tag$tag&uid$uid&sort$sort&order$order&page$page&limit$limit&interest=$interest&token=$token&folowing=$folowing&favorit=$favorite');

  Future<Response> uploadProductPic(
          {@required String token, @required File pic}) =>
      post(apiUrl + 'providerpackage/uplaodPic',FormData({
            'token': token,
            'file': MultipartFile(
              pic,
              filename: pic.path.split('/').last,
            ),
          }));

  Future<Response> subSet(
          {@required String token,}) =>
      post(apiUrl + 'profile/subset',FormData({
            'token': token,
          }));

  Future<Response> userSubSet({@required String token,
                               @required String uId}) =>
      get(apiUrl + 'providers/subset?token=$token&user_id=$uId');

  Future<Response> deleteSubset(
          {@required String token,@required String id,}) =>
      post(apiUrl + 'profile/deletesubset',FormData({
            'token': token,
            'id': id,
          }));

  Future<Response> acceptSubset( {@required String token,@required String id,}) =>
      post(apiUrl + 'profile/acceptsubset',FormData({
            'token': token,
            'id': id,
          }));


  Future<Response> addSubset( {@required String token,@required String id,}) =>
      post(apiUrl + 'profile/addsubset',FormData({
            'token': token,
            'user_id': id,
          }));


  Future<Response> showPackage(String token, String id) =>
      get(apiUrl + 'providerpackage/show?proId=$id&token=$token');


  Future<Response> showUserPackage(String token, String id) =>
      get(apiUrl + 'package/show?bId=$id&token=$token');


  Future<Response> providers(String token, String level, String folowing, String special, String activity_scope) =>
      get(apiUrl + 'providers?token=$token&word=&level=$level&following=$folowing&special=$special&activity_scope=$activity_scope');

  Future<Response> showProvider(String token, String bid) =>
      get(apiUrl + 'providers/show?token=$token&bId=$bid');

  Future<Response> unfollow(String token, String id) =>
      post(apiUrl + 'providers/unfollow',FormData({
        'token': token,
        'id': id,
      }));

  Future<Response> follow(String token, String user_id) =>
      post(apiUrl + 'providers/follow',FormData({
        'token': token,
        'user_id': user_id,
      }));

  Future<Response> checkpackage(String token, String code) =>
      post(apiUrl + 'package/checkpackage',FormData({
        'token': token,
        'code': code,
      }));

  Future<Response> buyPlan({@required String token, @required String plan_id,@required String paymentType,@required String coupon}) =>
      post(apiUrl + 'plans/order',FormData({
        'token': token,
        'plan_id': plan_id,
        'paymentType': paymentType,
        'coupon': coupon,
      }));

  Future<Response> resetPass({@required String mobile, @required String code,@required String pass,@required String verification_token}) =>
      post(apiUrl + 'user/comfirm',FormData({
        'mobile': mobile,
        'code': code,
        'pass': pass,
        'verification_token': verification_token,
      }));

  Future<Response> getSlider() => get(apiUrl + 'slider');

  Future<Response> about() => get(apiUrl + 'about');

  Future<Response> rules() => get(apiUrl + 'rules');

  Future<Response> getDivider() => get(apiUrl + 'app/banners');


  Future<Response> getAddress(String lat, String lng) => get("https://map.ir/fast-reverse?lat=$lat&lon=$lng",headers: {
    "x-api-key":
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY2N2RlYTRiMDc1Njg4MzI1YTg4YWZlYjFkYzdhZTU5MWM1MGFmMDYyNjM1NDY2ZTY1MGNmNTdlOTE4OWE0ZGMyNWQ5NWYzMDc5NGNhZTg0In0.eyJhdWQiOiIxMDM2NSIsImp0aSI6IjY2N2RlYTRiMDc1Njg4MzI1YTg4YWZlYjFkYzdhZTU5MWM1MGFmMDYyNjM1NDY2ZTY1MGNmNTdlOTE4OWE0ZGMyNWQ5NWYzMDc5NGNhZTg0IiwiaWF0IjoxNTk2NjMzMDUzLCJuYmYiOjE1OTY2MzMwNTMsImV4cCI6MTU5OTIyNTA1Mywic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.mdfSgceSTVLsq_lK2bryUH1nmh9xa29Oww1L52DX9G2BYcpKKem2QEIAf_qSCOI0YzNMs8J1GDZubK9Go5p9DFfwDAidEKvtv5l6ISnSkZh9qLuaF41_V0clYOxo6uhj-LrjORMUx1t6kmTulhU1Ho7HJdWv1Cgz58RH-MbdRLgZvurw8mzONlylil4RHCDtfy02IjMx4EUAFWMMb9PMNbRHBP3eRLzdFLvD2bc0sdtxnLoKoFZeMMCH3WY4H2MTjtrAInN5-4H44aU_qGmp17k4leecwBYXoO1Q-8DCUV-krGCS9SSZ9laCofp1_UzlNssS4MBlprRchCkwA47Gqw"
  } );
}
