import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/map/MapConstant.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount: 15,
                  itemBuilder:(context, index) => categoryItemList(title: 'عنوان دسته') ,
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
    );
  }
}
