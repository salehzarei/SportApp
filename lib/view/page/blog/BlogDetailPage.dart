import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

class BlogDetailPage extends StatefulWidget {

  String blogId;

  BlogDetailPage(this.blogId);

  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {

  final ArticleFunction articleFunction = Get.put(ArticleFunction());

  @override
  void initState() {
    getShared("token").then((token){
      articleFunction.showBlog(token: token, bId: widget.blogId);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark,
        title: Text("جزییات مقاله",
            style: TextStyle(fontSize: 18, color: Colors.white)),
        leading: IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: !articleFunction.showBlogLoading.value
          ? NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return false;
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sliderWidget(
                      length: articleFunction.showBlogModel.data.gallery.length,
                      loading: false,
                      context: context,
                      list:articleFunction.showBlogModel.data.gallery,
                      borderRadius: BorderRadius.circular(0),
                      fit: BoxFit.fill,
                      margin: EdgeInsets.all(0),
                      aspectRatio: 4 / 3,
                      lisString: true),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  articleFunction.showBlogModel.data.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:
                                      Theme.of(context).primaryColorDark),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 6,),
                                    Text("تعداد بازدید: ${ articleFunction.showBlogModel.data.hits.toString()}",

                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          articleFunction
                              .showBlogModel.data.description,
                          style: TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(0),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child:imageShower(
                                            imageUrl: articleFunction.showBlogModel.data.owner_pic,
                                            margin: EdgeInsets.all(8),
                                            fit: BoxFit.fill,
                                            borderRadius: BorderRadius.circular(100)),
                                      ),
                                      Text(
                                        articleFunction.showBlogModel.data.owner,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(width: 1, color: Colors.blue)),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(
                                  'مشهد , ابن سینا , بین ابن سینا ۱۸ و ۱۶ , پلاک ۲۷')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ))
          : loading(color: Theme.of(context).primaryColorDark),
    ));
  }
}