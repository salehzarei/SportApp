import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/plan/packageConstant.dart';

class PackageListPage extends StatefulWidget {
  @override
  _PackageListPageState createState() => _PackageListPageState();
}

class _PackageListPageState extends State<PackageListPage> {

  final PlanFunction planFunction = Get.put(PlanFunction());

  @override
  void initState() {
    planFunction.getPlanList(token: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark,
        title: Text(
            "لیست بسته ها",
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
        child: planFunction.planLoading.value?Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 30.0,
          ),
        ):ListView.builder(
          itemCount:planFunction.planList.length,
          padding: EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) => itemPackage(context: context, model: planFunction.planList[index]),
        ),
      ),
    ));
  }

}
