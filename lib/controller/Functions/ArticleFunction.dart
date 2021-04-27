import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/ArticleModel.dart';
import 'package:sportapplication/controller/Service/Request.dart';

class ArticleFunction extends GetxController{

  List errorMassages = [];
  final addArticleLoading = false.obs;

  final articleLoading = true.obs;

  final removeArticleBool = true.obs;
  ArticleModel articleModel;


  //////اد کردن مقاله توسط کاربران مجاز
  Future<int> addArticle(
      {@required String token,
      @required String title,
      @required String description,
      @required String category,
      @required List pics,
      @required List tags,
      @required String summary}) async {

    addArticleLoading.value = true;
    errorMassages.clear();

    final response = await ApiService().addArticle(
        pics: pics,
        token: token,
        category: category,
        description: description,
        title: title,
        summary: summary,
        tags:tags
      );

    if (response.statusCode == 200) {
      addArticleLoading.value = response.body['error'];
      if(!addArticleLoading.value){
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

  }


  //////اد کردن مقاله توسط کاربران مجاز
  Future articleList(
      {@required String token,
      @required String catId,
      @required String limit,
      @required String page,
      @required String word}) async {

    articleLoading.value = true;

    final response = await ApiService().articleList(
        catId:catId,
        limit: limit,
        page: page,
        token: token,
        word: word
      );

    if (response.statusCode == 200) {
      articleModel = ArticleModel.fromJson(response.body);
      articleLoading.value = false;
    } else {
      articleLoading.value = true;
    }
    update();
  }


  //////حذف مقالات
  Future <int> removeArticle(String token , String pId) async {
    final response = await ApiService().removeArticle(token,pId);
    if (response.statusCode == 200) {
      removeArticleBool.value = response.body['error'];
      if(!removeArticleBool.value){
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
  }



}