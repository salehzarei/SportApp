import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/component/appBarWidget.dart';
import 'package:sportapplication/view/page/category/CategoryItemList.dart';

class CategoryList extends StatefulWidget {

  int from;
  CategoryList({@required this.from});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final Controller activ = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              AppBarWidget(from: 1, onShopPressed: () {  }, onBackPressed: () { Get.back();},),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 4),
                        color: Colors.grey[200],
                        height: Get.height,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder:(context, index) => levelCategoryItem(context: context, index: index, controller: activ)),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                              child: Text(
                                activ.catTitle.value,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 3 / 3,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 10
                                ),
                                itemCount: 6,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => userItem(context: context, index: index, controller: activ),)
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
