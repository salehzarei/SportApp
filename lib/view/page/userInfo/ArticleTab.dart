import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class ArticleTab extends StatefulWidget {
  String uId;

  ArticleTab(this.uId);

  @override
  _ArticleTabState createState() => _ArticleTabState();
}

class _ArticleTabState extends State<ArticleTab> {
  final ArticleFunction articleFunction = Get.put(ArticleFunction());

  @override
  void initState() {
   getShared("token").then((token) {
     articleFunction.userArticleList(token: token,
         page: "",
         limit: "",
         catId: "",
         tag: "",
         uid: widget.uId,
         sort: "",
         folowing: "",
         order: "",
         interest: "",
         word: "");
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Directionality(
      textDirection: TextDirection.rtl,
      child:articleFunction.userArticleLoading.value
          ? Padding(
          padding: EdgeInsets.only(top: 80),
          child: loading(color: Theme.of(context).primaryColorDark))
          : Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15 , top: 10 , bottom: 10),
              child: Text("تعداد کل مقالات ${articleFunction.articleModel.post.length}"
                ,style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black),),
            ),
            ListView.builder(
              itemCount: articleFunction.articleModel.post.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 4),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context, index) => itemArticleUserList(context: context, index: index,data:articleFunction.articleModel.post[index]),),
          ],
        ),
      ),
    ));
  }
}
