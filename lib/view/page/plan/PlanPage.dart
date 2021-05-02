import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/Functions/ProfileFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:sportapplication/view/page/plan/packageConstant.dart';

class PackagePage extends StatefulWidget {
  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {

  final PlanFunction planFunction = Get.put(PlanFunction());
  final ProfileFunction profileFunction = Get.put(ProfileFunction());
  TextEditingController _discountController;
  FocusNode _discountFocus;
  String _token;

  @override
  void initState() {
    getShared('token').then((token) {
      _token=token;
      planFunction.getPlanList(token: _token);
      profileFunction.loadingUserData(tokens: _token);
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
    return Obx(()=>Expanded(
      child: Column(
        children: [
          !profileFunction.profileLoading.value?
              profileFunction.userProfile.plan.isEmpty?Container(
                padding: EdgeInsets.only(right: 15 , left: 15,top: 15),
                child: Center(
                  child: Text( "هیچ پلن فعالی ندارید", style: TextStyle(fontSize: 14 , color: Theme.of(context).primaryColorDark),),
                ),
              ) :
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
                    Text(
                      profileFunction.userProfile.plan[0].title,
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
                    Text("تاریخ اتمام",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),),
                    Text(profileFunction.userProfile.plan[0].expire_date,
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
          ):
              Padding(padding: EdgeInsets.symmetric(vertical: 20),
              child:loading(color: Theme.of(context).primaryColorDark),),

          Expanded(
            child: planFunction.planLoading.value?Center(
              child: SpinKitThreeBounce(
                color: Colors.white,
                size: 30.0,
              ),
            ):ListView.builder(
              itemCount:planFunction.planList.length,
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) => itemPackage(context: context, model: planFunction.planList[index], onTab:(){
                _discountController.text="";
                showBtn(planList: planFunction.planList[index],context: context, focusNode: _discountFocus,controller: _discountController, payClick: (){
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
            ),
          )
        ],
      ),
    ));
  }
}
