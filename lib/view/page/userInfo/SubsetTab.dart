import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class SubsetTab extends StatefulWidget {
  String uId;

  SubsetTab(this.uId);

  @override
  _SubsetTabState createState() => _SubsetTabState();
}

class _SubsetTabState extends State<SubsetTab> {
  final SubSetFunction subSetFunction = Get.put(SubSetFunction());
  @override
  void initState() {
    getShared("token").then((token){
      subSetFunction.getUserSubset(token: token, uId: widget.uId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Directionality(
      textDirection: TextDirection.rtl,
      child: subSetFunction.userSubsetLoading.value? Padding(
        padding: EdgeInsets.only(top: 50),
        child: SpinKitThreeBounce(
          color:Theme.of(context).primaryColorDark,
          size: 30.0,
        ),
      ): Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15 , top: 10 , bottom: 10),
            child: Text("تعداد کاربران زیر مجموعه ${subSetFunction.subSetModel.post.length}"
              ,style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black),),
          ),
          ListView.builder(
            itemCount: subSetFunction.subSetModel.post.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 4),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) => itemSubsetUserList(context: context, index: index,data:subSetFunction.subSetModel.post[index],)),
        ],
      ),
    ));
  }
}
