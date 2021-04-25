import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/controller/Functions/AddPackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/myInfo/subsetConstant.dart';

class MyPackage extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {

  final AddPackageFunction addPackage = Get.put(AddPackageFunction());
  List<MyPackagePost> _myListPackage = [];

  @override
  void initState() {
    getShared("token").then((value) {
      addPackage.getMyPackageList(token: value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
            "لیست پکیج های من",
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
          itemCount: _myListPackage.length,
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) => myPackageList(context: context, index: index,data:_myListPackage[index]),
        ),
      ),
    );
  }

}
