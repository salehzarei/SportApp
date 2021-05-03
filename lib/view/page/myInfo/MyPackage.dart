import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/MyPackageModel.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/myInfo/subsetConstant.dart';
import 'package:sportapplication/view/page/packageDetail/PackagesListItemDetail.dart';

class MyPackage extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {

  final PackageFunction addPackage = Get.put(PackageFunction());
  List<MyPackagePost> _myListPackage = [];
  bool _loaded = false;
  String _token;

  @override
  void initState() {
    getShared("token").then((token) {
      addPackage.getMyPackageList(token: token).then((value) {
        if(mounted){
          setState(() {
            _myListPackage=value;
            _loaded = true;
            _token = token;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark,
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
        child: _loaded ?
        _myListPackage.isEmpty ?noItem() :ListView.builder(
          itemCount: _myListPackage.length,
          padding: EdgeInsets.only(top: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) => myPackageList(context: context, index: index,data:_myListPackage[index], removePackage: (){
            _removePackage(_myListPackage[index].id.toString());
          }, editPackage: (){

          }, onTab: (){
            Get.to(PackagesListItemDetail(_myListPackage[index].id.toString()));
          }),
        ):SpinKitThreeBounce(
            color: Theme.of(context).primaryColorDark,
            size: 30.0,),
      ),
    );
  }

  _removePackage(String id) {
    addPackage.removePackage(_token, id).then((value){
      if(value == 200){
        listSnackBar(list: addPackage.errorMassages, err: false,);
        if(mounted){
          setState(() {
            _loaded = false;
          });
        }
        addPackage.getMyPackageList(token: _token).then((value) {
          if(mounted){
            setState(() {
              _myListPackage=value;
              _loaded = true;
            });
          }
        });
      }else{
        listSnackBar(list: addPackage.errorMassages, err: true,);
      }
    });
  }

}
