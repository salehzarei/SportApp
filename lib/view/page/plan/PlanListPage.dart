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
  int discountCoupon= 0;

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
            shoBtn( planFunction.planList[index]);
            // showBtn(planList: planFunction.planList[index],context: context, focusNode: _discountFocus,controller: _discountController, payClick: (){
            //   launchURL(planFunction.url);
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
            // }, discountPrice: discountCoupon);
          }),
        ):noItem()
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
                                  '${maskedText(( planList.off).toString())} تومان ',
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
                                  '${maskedText((planList.off - discountCoupon).toString())} تومان ',
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


