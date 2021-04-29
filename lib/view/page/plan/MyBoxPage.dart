import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/plan/packageConstant.dart';

class MyBoxPage extends StatefulWidget {
  @override
  _MyBoxPageState createState() => _MyBoxPageState();
}

class _MyBoxPageState extends State<MyBoxPage> {
  final PlanFunction pack = Get.put(PlanFunction());
  @override
  void initState() {
    getShared('token').then((t) => pack.getMyPackagesList(token: t));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 2,
            brightness: Brightness.dark,
            title: Text("بسته های من",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            leading: IconButton(
                color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Get.back();
                }),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: pack.mypackLoading.value
                ? loading()
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child:pack.myPackagesList.isEmpty ? noItem(): ListView.builder(
                      itemCount: pack.myPackagesList.length,
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => itemMyBox(
                          context: context, lists: pack.myPackagesList[index]),
                    ),
                  ),
          ),
        ));
  }
}
