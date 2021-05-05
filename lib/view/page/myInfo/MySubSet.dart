import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/myInfo/subsetConstant.dart';

class MySubSet extends StatefulWidget {
  @override
  _MySubSetState createState() => _MySubSetState();
}

class _MySubSetState extends State<MySubSet> {
  final SubSetFunction subSetFunction = Get.put(SubSetFunction());
  String _token;
  @override
  void initState() {
    getShared("token").then((token) {
      subSetFunction.getSubset(token);
      _token = token;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Scaffold(
          appBar: AppBar(
            elevation: 2,
            brightness: Brightness.dark,
            title: Text(
                "لیست درخواست ها",
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
            child: subSetFunction.loading.value?
            Center(
              child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColorDark,
                size: 30.0,
              ),
            ):
            subSetFunction.subSetModel.post.isEmpty ? noItem() : ListView.builder(
              itemCount: subSetFunction.subSetModel.post.length,
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) => subsetItemList(context: context, index: index,data:subSetFunction.subSetModel.post[index],
                  onTap: (){

                  },
                  removeClick: (){
                    subSetFunction.deleteSubset(_token , subSetFunction.subSetModel.post[index].id.toString()).whenComplete(() =>  subSetFunction.getSubset(_token));
                    listSnackBar(list: subSetFunction.errorMassages, err: subSetFunction.deleteError.value);
                  },
                  removeReq: (){
                    subSetFunction.deleteSubset(_token , subSetFunction.subSetModel.post[index].id.toString()).whenComplete(() => subSetFunction.getSubset(_token));
                    listSnackBar(list: subSetFunction.errorMassages, err: subSetFunction.deleteError.value);
                  },
                  acceptClick: (){
                    subSetFunction.acceptSubset(_token , subSetFunction.subSetModel.post[index].id.toString()).whenComplete(() => subSetFunction.getSubset(_token));
                    listSnackBar(list: subSetFunction.errorMassages, err: subSetFunction.deleteError.value);
                  }),
            ),
          ),
        )


    );
  }

}
