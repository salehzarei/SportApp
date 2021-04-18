import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/following/followConstant.dart';
import 'package:sportapplication/view/page/package/packageConstant.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class FollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
            "دنبال کننده ها",
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
          padding: EdgeInsets.only(top: 10),
          itemCount: 14,
          shrinkWrap: true,
          itemBuilder: (context, index) => followListItem(context: context, index: index),),
      ),
    );
  }
}
