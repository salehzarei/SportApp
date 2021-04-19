import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/view/page/map/MapConstant.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final RegisterFunction registerFunction = Get.put(RegisterFunction());
  int indexItem = 0;

  @override
  void initState() {
    registerFunction.getProductCategories(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 45,
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: 3),
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: registerFunction.categoryLoading.value?0:registerFunction.categoryList.length,
                  itemBuilder:(context, index) => categoryItemList(model: registerFunction.categoryList[index],onTab:(){
                    if(mounted){
                      setState(() {
                        indexItem = index;
                      });
                    }
                  }, index: index , indexItem:indexItem, context: context),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => itemPackageList(context: context, index: index),))

            ],
          ),
        ),
      ),
    ));
  }
}
