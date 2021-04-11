import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constans {
  Widget divider(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Row(
            children: [
              Text(
                'مشاهده همه',
                style: TextStyle(color: Colors.blue),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}
