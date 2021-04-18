import 'package:flutter/material.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class SubsetTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15 , top: 10 , bottom: 10),
            child: Text("تعداد کاربران زیر مجموعه 14"
              ,style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black),),
          ),
          ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 4),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) => itemSubsetUserList(context: context, index: index),),
        ],
      ),
    );
  }
}