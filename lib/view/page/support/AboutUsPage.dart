import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Text("قوانین",
          style: TextStyle(
              fontSize: 14 ,
              color: Colors.black
          ),),
      ),
    );
  }
}
