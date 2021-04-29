import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/PlanModel.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/plan/packageConstant.dart';

class PackageListPage extends StatefulWidget {
  @override
  _PackageListPageState createState() => _PackageListPageState();
}

class _PackageListPageState extends State<PackageListPage> {

  final PlanFunction planFunction = Get.put(PlanFunction());

  TextEditingController _discountController;
  FocusNode _discountFocus;
  String _token;

  @override
  void initState() {
    getShared("token").then((token){
      _token = token;
      planFunction.getPlanList(token: token);
    });
    _discountController = TextEditingController();
    _discountFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _discountController.dispose();
    _discountFocus.dispose();
    super.dispose();
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
        child: planFunction.planLoading.value?loading(color: Theme.of(context).primaryColorDark):
        planFunction.planList.isNotEmpty? ListView.builder(
          itemCount:planFunction.planList.length,
          padding: EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          itemBuilder: (context, index) => itemPackage(context: context, model: planFunction.planList[index], onTab: (){
            _discountController.text="";
            showBtn(planList: planFunction.planList[index],context: context, focusNode: _discountFocus,controller: _discountController, payClick: (){
              launchURL(planFunction.url);
              planFunction.buyPlan(token: _token, plan_id:  planFunction.planList[index].id.toString(), paymentType: "7").then((value) {
                if(value == 200){
                  launchURL(planFunction.url);
                }else{
                  listSnackBar(list:planFunction.errorMassages ,  err: true);
                }
              });
            }, checkCouponClick: (){
              if(_discountController.text.isNotEmpty){
                planFunction.checkCoupon(token: _token,
                    plan_id: planFunction.planList[index].id.toString(),
                    coupon: _discountController.text).then((value){
                  if(value == 200){
                    listSnackBar(list:planFunction.errorMassages , err:false);
                  }else{
                    listSnackBar(list:planFunction.errorMassages ,  err: true);
                  }

                });
              }
            });
          }),
        ):noItem()
      ),
    ));
  }


}


