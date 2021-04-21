import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/myInfo/subsetConstant.dart';

class MySubSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
            "لیست مربی ها",
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
        child: ListView.builder(
          itemCount: 14,
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) => subsetItemList(context: context, index: index),
        ),
      ),
    );
  }
}
