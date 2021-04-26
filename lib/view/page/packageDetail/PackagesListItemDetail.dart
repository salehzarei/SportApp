import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

class PackagesListItemDetail extends StatefulWidget {
  String id;

  PackagesListItemDetail(this.id);

  @override
  _PackagesListItemDetailState createState() => _PackagesListItemDetailState();
}

class _PackagesListItemDetailState extends State<PackagesListItemDetail> {

  final PackageFunction packageFunction = Get.put(PackageFunction());

  @override
  void initState() {
    getShared("token").then((token){
      packageFunction.showPackage(token ,widget.id );
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
            "جزییات پکیج",
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
      body: !packageFunction.showPackageLoading.value?
          NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowGlow();
                return false;
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sliderWidget(length:  packageFunction.showPackageModel.data.gallery.length,
                          loading:false,
                          context: context,
                          list: packageFunction.showPackageModel.data.gallery,
                          borderRadius: BorderRadius.circular(0),
                          fit: BoxFit.fill,
                          margin: EdgeInsets.all(0),
                          aspectRatio: 4/3),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(packageFunction.showPackageModel.data.title,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark
                            ),),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                ),
                                Text(
                                  packageFunction.showPackageModel.data.title,
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(packageFunction.showPackageModel.data.description,style: TextStyle(
                                fontSize: 16,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 10.0,
                        margin: EdgeInsets.all(0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("قیمت پکیج: ",style: TextStyle(fontSize: 16 , color: Colors.black),),
                                  SizedBox(width: 6,),
                                  packageFunction.showPackageModel.data.discount == 0
                                      ? Container()
                                      : Text(
                                    maskedText(packageFunction.showPackageModel.data.discount.toString()),
                                    style: TextStyle(
                                        decoration:
                                        TextDecoration.lineThrough,
                                        decorationColor: Colors.red[800],
                                        // decorationStyle: TextDecorationStyle.double,
                                        decorationThickness: 1.5,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  packageFunction.showPackageModel.data.discount == 0
                                      ? Container()
                                      : SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${maskedText(packageFunction.showPackageModel.data.discount.toString())} تومان ',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              packageFunction.showPackageModel.data.discount == 0
                                  ? Container()
                                  : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color:
                                    Theme.of(context).primaryColorDark),
                                child: Center(
                                  child: Text(
                                    packageFunction.showPackageModel.data.discount_type == 2
                                        ? '${packageFunction.showPackageModel.data.discount} %'
                                        : packageFunction.showPackageModel.data.discount.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          elevation: 10.0,
                          margin: EdgeInsets.all(0),
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "تاریخ شروع:",
                                      style: TextStyle(fontSize: 15, color: Colors.black),
                                    ),
                                    Text(
                                      packageFunction.showPackageModel.data.sdate,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Theme.of(context).primaryColorDark),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "تاریخ پایان:",
                                      style: TextStyle(fontSize: 15, color: Colors.black),
                                    ),
                                    Text(
                                      packageFunction.showPackageModel.data.edate,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Theme.of(context).primaryColorDark),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        // height: 60,
                        child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'درباره ${ packageFunction.showPackageModel.data.title}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(
                                        'مشهد , ابن سینا , بین ابن سینا ۱۸ و ۱۶ , پلاک ۲۷')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        // height: 60,
                        child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.lock_clock,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'ساعت سرویس دهی',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('ساعت ۱۰ الی ۱۹:۳۰')
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(width: 1, color: Colors.blue)),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        // height: 60,
                        child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'روز های سرویس دهی',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('همه روزه')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )):
          Center(
        child: SpinKitThreeBounce(
          color: Theme.of(context).primaryColorDark,
          size: 30.0,),
      ),
    ));
  }
}
