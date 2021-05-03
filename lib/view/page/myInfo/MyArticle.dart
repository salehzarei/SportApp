import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/myInfo/subsetConstant.dart';

class MyArticle extends StatefulWidget {
  @override
  _MyArticleState createState() => _MyArticleState();
}

class _MyArticleState extends State<MyArticle> {
  ArticleFunction articleFunction = Get.put(ArticleFunction());
  String _token;

  @override
  void initState() {
    getShared("token").then((token) {
      articleFunction.articleList(token: token, catId: "", limit: "", page: "", word: "");
      _token = token;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark,
        title: Text(
            "لیست مقالات من",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white
            )
        ),
        leading:IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Get.back();
            }) ,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: articleFunction.articleLoading.value?
        SpinKitThreeBounce(
          color: Theme.of(context).primaryColorDark,
          size: 30.0,):
        articleFunction.articleModel.post.isEmpty ? noItem():ListView.builder(
          itemCount: articleFunction.articleModel.post.length,
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) => myArticleList(context: context,
              index: index,
              data:articleFunction.articleModel.post[index],
              removeArticle:(){
                _removeArticle(articleFunction.articleModel.post[index].id.toString(),);
              }),
        ),
      ),
    ));
  }

  _removeArticle(String id) {
    print(_token);
    print(id);
    articleFunction.removeArticle(_token, id).then((value){
      if(value == 200){
        listSnackBar(list: articleFunction.errorMassages, err: false,);
        articleFunction.articleLoading.value = true;
        articleFunction.articleList(token: _token, catId: "", limit: "", page: "", word: "");
      }else{
        listSnackBar(list: articleFunction.errorMassages, err: true,);
      }
    });
  }
}
