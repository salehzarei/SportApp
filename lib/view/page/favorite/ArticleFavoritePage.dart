import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/favorite/FavoriteConstant.dart';

class ArticleFavoritePage extends StatefulWidget {
  @override
  _ArticleFavoritePageState createState() => _ArticleFavoritePageState();
}

class _ArticleFavoritePageState extends State<ArticleFavoritePage> {
  final ArticleFunction articleFunction = Get.put(ArticleFunction());
  String _token;

  @override
  void initState() {
    getShared("token").then((token) {
      _token = token;
      fetchItem(token);
    });

    super.initState();
  }

  fetchItem(String token) {
    articleFunction
        .blogList(
            token: token,
            folowing: '',
            interest: '',
            uid: '',
            page: '',
            order: '',
            catId: '',
            favorite: '1',
            word: '',
            tag: '',
            limit: '',
            sort: '',
            asc: '')
        .whenComplete(() {
      if (!articleFunction.blogLoading.value) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Directionality(
          textDirection: TextDirection.rtl,
          child: articleFunction.blogLoading.value
              ? loading(color: Theme.of(context).primaryColorDark)
              : ListView.builder(
                  itemCount: articleFunction.blogModel.post.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) => itemArticleFav(
                      index: index,
                      context: context,
                      data: articleFunction.blogModel.post[index],
                      onTap: () {
                        articleFunction
                            .removeFav(
                                token: _token,
                                proId: articleFunction
                                    .showBlogModel.data.favorit
                                    .toString())
                            .then((value) {
                          if (value == 200) {
                            listSnackBar(
                                list: articleFunction.errorMassages,
                                err: false);
                            fetchItem(_token);
                          } else {
                            listSnackBar(
                                list: articleFunction.errorMassages, err: true);
                          }
                        });
                      }, fav: true),
                ),
        ));
  }
}
