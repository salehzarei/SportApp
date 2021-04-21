import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/plan/packageConstant.dart';

class PackagePage extends StatefulWidget {
  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {

  final PlanFunction planFunction = Get.put(PlanFunction());

  @override
  void initState() {
    planFunction.getPlanList(token: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 15 , left: 15,top: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("پکیج فعال",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),),
                    Text("یک ماهه",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14
                      ),),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("تاریخ شروع",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),),
                    Text("1400/01/22",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14
                      ),),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only( top: 15),
                    height: 1,
                    color: Colors.grey[500]
                ),
              ],
            ),
          ),
          Expanded(
            child: planFunction.planLoading.value?lottieLoading():ListView.builder(
              itemCount:planFunction.planList.length,
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) => itemPackage(context: context, model: planFunction.planList[index]),
            ),
          )
        ],
      ),
    ));
  }
}
