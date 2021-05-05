import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/userInfo/DetailConstant.dart';

class UserPackageTab extends StatefulWidget {
  String uId;

  UserPackageTab(this.uId);

  @override
  _UserPackageTabState createState() => _UserPackageTabState();
}

class _UserPackageTabState extends State<UserPackageTab> {
  final PackageFunction packageFunction = Get.put(PackageFunction());

  @override
  void initState() {
    getShared("token").then((token) {
      packageFunction.geUserPackageList(token: token,
          catId: "",
          word: "",
          uid: widget.uId,
          sort: "",
          order: "",
          limit: "",
          interest: "",
          page: "",
          special: "",
          folowing: "",
          asc: "",
          favorite: '',
          level: '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Directionality(
      textDirection: TextDirection.rtl,
      child: packageFunction.userPackageLoading.value? Padding(
        padding: EdgeInsets.only(top: 50),
        child: SpinKitThreeBounce(
          color:Theme.of(context).primaryColorDark,
          size: 30.0,
        ),
      ): Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15, top: 10, bottom: 10),
              child: Text(
                "تعداد کل پکیج ها ${packageFunction.userPackageModel.post.length}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            ListView.builder(
              itemCount: packageFunction.userPackageModel.post.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 4),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  itemPackageUserList(context: context, index: index,data:packageFunction.userPackageModel.post[index]),
            ),
          ],
        ),
      ),
    ));
  }
}
