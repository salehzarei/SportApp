import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/following/followConstant.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  final RegisterFunction registerFunction = Get.put(RegisterFunction());
  String _token;

  @override
  void initState() {
    getShared('token').then((token) {
      registerFunction.providers( token: token, following: '1', level: '', activity_scope: '', special: '',);
      _token = token;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      appBar: AppBar(
        elevation: 2,
        brightness: Brightness.dark,
        title: Text(
            "دنبال کننده ها",
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
        child: registerFunction.providerLoading.value?Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 30.0,
          ),
        ):ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: registerFunction.providerList.post.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => followListItem(context: context, index: index,data:registerFunction.providerList.post[index], removeProvider: (){
            registerFunction.unFollow(_token, registerFunction.providerList.post[index].following.toString()).whenComplete((){
              listSnackBar(list: registerFunction.errorMassages, err: registerFunction.checkerror.value);
              print(!registerFunction.checkerror.value);
              if(registerFunction.checkerror.value){
                registerFunction.providerLoading.value = true;
                registerFunction.providers( token: _token, following: '1', level: '', activity_scope: '', special: '',);
              }
            });
          }),),
      ),
    ));
  }
}
