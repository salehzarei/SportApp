import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/component/appBarWidget.dart';
import 'package:sportapplication/view/page/category/CategoryItemList.dart';

class CategoryList extends StatefulWidget {

  int from;
  int level;
  String title;
  CategoryList({@required this.from,@required this.level,@required this.title});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  final Controller activ = Get.put(Controller());
  final RegisterFunction registerFunction = Get.put(RegisterFunction());

  bool _loaded = false;
  String _token;

  @override
  void initState() {
    activ.catActive(-1);
    getShared('token').then((token) {
      _token = token;
      registerFunction.providerLoading.value = true;
      registerFunction.getProductCategories(widget.level).whenComplete(() {
        registerFunction.providers( token: token, following: '', level: widget.level.toString(), activity_scope: '', special: '',).whenComplete(() {
          setState(() {
            _loaded = true;
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              AppBarWidget(from: 1, onShopPressed: () {}, onBackPressed: () { Get.back();},),
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
                            itemCount: registerFunction.categoryLoading.value?0:registerFunction.categoryList.length,
                            itemBuilder:(context, index) => levelCategoryItem(
                                context: context,
                                index: index,
                                controller: activ,
                                model: registerFunction.categoryList[index],
                                onTap:(){
                                  registerFunction.providers(token: _token,
                                    following: '',
                                    level: '',
                                    activity_scope: registerFunction.categoryList[index].id.toString(),
                                    special: '');
                                 activ.catActive(index);
                            })),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                              child: registerFunction.categoryLoading.value?Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor: Colors.red)):Text(
                                widget.title,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            registerFunction.providerLoading.value?
                            Expanded(
                              child: Center(
                                child:  loading(color: Theme.of(context).primaryColorDark)
                              ),
                            ):
                            registerFunction.providerList.post.isEmpty?
                            Expanded(
                              child: Center(
                                child: noItem(),
                              ),
                            ):
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
                                itemCount: registerFunction.providerList.post.length,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => userItem(context: context, index: index, controller: activ,data:registerFunction.providerList.post[index]),)
                          ],
                        )
                    )
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
