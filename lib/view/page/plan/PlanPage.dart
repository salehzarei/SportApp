import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/PlanModel.dart';
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
  int discountCoupon= 0;

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
                    Text("طرح فعال",
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
                discountCoupon = 0;
                shoBtn(planFunction.planList[index]);
                // showBtn(planList: planFunction.planList[index],context: context, focusNode: _discountFocus,controller: _discountController, payClick: (){
                //   planFunction.buyPlan(token: _token, plan_id:  planFunction.planList[index].id.toString(), paymentType: "7").then((value) {
                //     if(value == 200){
                //       launchURL(planFunction.url);
                //     }else{
                //       listSnackBar(list:planFunction.errorMassages ,  err: true);
                //     }
                //   });
                // }, checkCouponClick: (){
                //   if(_discountController.text.isNotEmpty){
                //     planFunction.checkCoupon(token: _token,
                //         plan_id: planFunction.planList[index].id.toString(),
                //         coupon: _discountController.text).then((value){
                //       if(value == 200){
                //         if(mounted){
                //           setState(() {
                //             discountCoupon = planFunction.couponDiscount;
                //           });
                //         }
                //         listSnackBar(list:planFunction.errorMassages , err:false);
                //       }else{
                //         listSnackBar(list:planFunction.errorMassages ,  err: true);
                //       }
                //
                //     });
                //   }
                // }, discountPrice: discountCoupon, showBtnState: null);
              }),
            ),
          )
        ],
      ),
    ));
  }

  shoBtn(PlanData planList){
    showModalBottomSheet(context: context,
        // backgroundColor: Theme.of(context).primaryColorDark,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) => StatefulBuilder(
            builder: (context, showBtnStateFull) =>Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                padding:EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 5,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            color:Theme.of(context).primaryColorDark,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("مشخصات پلن:",style: TextStyle(
                              fontSize: 14,
                              color: Colors.black
                          ),),
                          Text(planList.title ,style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87
                          ),)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "قیمت:",
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Row(
                              children: [
                                planList.off == 0
                                    ? Container()
                                    : Text(
                                  maskedText(planList.price.toString()),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red[800],
                                      // decorationStyle: TextDecorationStyle.double,
                                      decorationThickness: 1.5,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  planList.off == 0?'${maskedText((planList.price ).toString())} تومان ' :'${maskedText((planList.off).toString())} تومان ',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: textFormFieldHintWidget(
                                  context: context,
                                  focus: _discountFocus,
                                  controller: _discountController,
                                  hint: "کد تخفیف",
                                  maxLine: 1,
                                  minLine: 1,
                                  keyboardType: TextInputType.text,
                                  maxLength: 1000),
                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: () {
                                if(_discountController.text.isNotEmpty){
                                  planFunction.checkCoupon(token: _token,
                                      plan_id: planList.id.toString(),
                                      coupon: _discountController.text).then((value){
                                    if(value == 200){
                                      if(mounted){
                                        setState(() {
                                          discountCoupon = planFunction.couponDiscount;
                                          showBtnStateFull(() {
                                          });
                                        });
                                      }
                                      listSnackBar(list:planFunction.errorMassages , err:false);
                                    }else{
                                      listSnackBar(list:planFunction.errorMassages ,  err: true);
                                    }

                                  });
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: Colors.white))),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                              child: Text(
                                "ثبت",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Divider(height: 1,color: Colors.grey[300],),
                      SizedBox(height: 6,),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            discountCoupon != 0? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "میزان تخفیف : ",
                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                ),
                                Text(
                                  '${maskedText((discountCoupon).toString())} تومان ',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ):SizedBox(),
                            SizedBox(height:  discountCoupon != 0?8:0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "قیمت نهایی : ",
                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                ),
                                Text(
                                  planList.off == 0?'${maskedText((planList.price -discountCoupon).toString())} تومان ' :'${maskedText((planList.off-discountCoupon).toString())} تومان ',
                              // '${maskedText((planList.off - discountCoupon).toString())} تومان ',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child:ElevatedButton(
                              onPressed: (){
                                discountCoupon == 0?
                                planFunction.buyPlan(token: _token, plan_id:  planList.id.toString(), paymentType: "7").then((value) {
                                  if(value == 200){
                                    launchURL(planFunction.url);
                                  }else{
                                    listSnackBar(list:planFunction.errorMassages ,  err: true);
                                  }
                                }):
                                planFunction.buyPlan(token: _token, plan_id:  planList.id.toString(), paymentType: "7",coupon: _discountController.text).then((value) {
                                  if(value == 200){
                                    launchURL(planFunction.url);
                                  }else{
                                    listSnackBar(list:planFunction.errorMassages ,  err: true);
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: Colors.red))),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white)),
                              child: Text(
                                "ثبت",
                                style: TextStyle(fontSize: 12, color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 1,
                            child:ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: Colors.white))),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                              child: Text(
                                "انصراف",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        ));
  }

}
