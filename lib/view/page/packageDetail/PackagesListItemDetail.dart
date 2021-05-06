import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class PackagesListItemDetail extends StatefulWidget {

  String id;
  PackagesListItemDetail(this.id);

  @override
  _PackagesListItemDetailState createState() => _PackagesListItemDetailState();
}

class _PackagesListItemDetailState extends State<PackagesListItemDetail> {
  final PackageFunction packageFunction = Get.put(PackageFunction());
  String _token;
  int fav= 0;

  @override
  void initState() {
    getShared("token").then((token) {
      fetchItem(token);
    });
    super.initState();
  }

  fetchItem(String token){
    packageFunction.showUserPackage(token, widget.id).whenComplete(() {
      if(mounted){
        setState(() {
          fav = packageFunction.showPackageModel.data.favorit;
          _token = token;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            elevation: 2,
            brightness: Brightness.dark,
            title: Text("جزییات پکیج",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            leading: IconButton(
                color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Get.back();
                }),
            actions: [
              !packageFunction.showPackageLoading.value?
              IconButton(
                  color: Colors.white,
                  iconSize: 20,
                  icon:packageFunction.showPackageModel.data.favorit==0? Icon(Icons.favorite_border):Icon(Icons.favorite),
                  onPressed: () {
                    if(packageFunction.showPackageModel.data.favorit==0){
                      packageFunction.addFavorite(token: _token, proId: widget.id).then((value) {
                        if(value == 200){
                          listSnackBar(list:packageFunction.errorMassages , err:false );
                          fetchItem(_token);
                        }else{
                          listSnackBar(list:packageFunction.errorMassages , err:true );
                        }
                      });
                    }else{
                      packageFunction.removeFav(token: _token, proId: packageFunction.showPackageModel.data.favorit.toString()).then((value) {
                        if(value == 200){
                          fetchItem(_token);
                          listSnackBar(list:packageFunction.errorMassages , err:false );
                        }else{
                          listSnackBar(list:packageFunction.errorMassages , err:true );
                        }
                      });
                    }
                  }):SizedBox(),
            ],
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: !packageFunction.showPackageLoading.value
              ? NotificationListener<OverscrollIndicatorNotification>(
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
                          sliderWidget(
                              length: packageFunction
                                  .showPackageModel.data.gallery.length,
                              loading: false,
                              context: context,
                              list:
                                  packageFunction.showPackageModel.data.gallery,
                              borderRadius: BorderRadius.circular(0),
                              fit: BoxFit.fill,
                              margin: EdgeInsets.all(0),
                              aspectRatio: 4 / 3, lisString: false),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IntrinsicHeight(child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          Text(
                                            packageFunction.showPackageModel.data.title,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                Theme.of(context).primaryColorDark),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.visibility,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(width: 6,),

                                              Text("تعداد بازدید: ${packageFunction
                                                  .showPackageModel.data.hits.toString()}",

                                                style: TextStyle(color: Colors.grey),
                                              )
                                            ],
                                          ),
                                    ],)),
                                    InkWell(
                                      onTap: () {
                                        Get.dialog(_showQr());
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10)),
                                        child: SfBarcodeGenerator(
                                        value:  packageFunction.showPackageModel.data.qrcode,
                                        symbology: QRCode(),
                                      ),
                                      ),
                                    )
                                  ],
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  packageFunction
                                      .showPackageModel.data.description,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 10.0,
                            margin: EdgeInsets.all(0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "قیمت پکیج: ",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      packageFunction.showPackageModel.data
                                                  .discount ==
                                              0
                                          ? Container()
                                          : Text(
                                              maskedText(packageFunction
                                                  .showPackageModel
                                                  .data
                                                  .price
                                                  .toString()),
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor:
                                                      Colors.red[800],
                                                  // decorationStyle: TextDecorationStyle.double,
                                                  decorationThickness: 1.5,
                                                  color: Colors.grey[500],
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                      packageFunction.showPackageModel.data
                                                  .discount ==
                                              0
                                          ? Container()
                                          : SizedBox(
                                              width: 5,
                                            ),
                                      Text(
                                        '${maskedText(packageFunction.showPackageModel.data.final_price.toString())} تومان ',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  packageFunction
                                              .showPackageModel.data.discount ==
                                          0
                                      ? Container()
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Theme.of(context)
                                                  .primaryColorDark),
                                          child: Center(
                                            child: Text(
                                              packageFunction.showPackageModel
                                                          .data.discount_type ==
                                                      2
                                                  ? '${packageFunction.showPackageModel.data.discount} %'
                                                  : packageFunction
                                                      .showPackageModel
                                                      .data
                                                      .discount
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ),
                          ),
                          packageFunction.showPackageModel.data.discount == 0?SizedBox(height: 6,):Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Card(
                              elevation: 10.0,
                              margin: EdgeInsets.all(0),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 10, right: 10, bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "تاریخ شروع : ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          packageFunction
                                              .showPackageModel.data.sdate,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .primaryColorDark),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "تاریخ پایان : ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          packageFunction
                                              .showPackageModel.data.edate,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .primaryColorDark),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(0),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                child:imageShower(
                                                    imageUrl: packageFunction.showPackageModel.data.owner_pic,
                                                    margin: EdgeInsets.all(8),
                                                    fit: BoxFit.fill,
                                                    borderRadius: BorderRadius.circular(100)),
                                              ),

                                              Text(
                                                packageFunction.showPackageModel.data.owner,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            launchURL('tel:${ packageFunction.showPackageModel.data.owner_cell}');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border:
                                                Border.all(width: 1, color: Colors.blue)),
                                            child: Icon(
                                              Icons.call,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        packageFunction.showPackageModel.data.owner_address,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ))
              : Center(
                  child: SpinKitThreeBounce(
                    color: Theme.of(context).primaryColorDark,
                    size: 30.0,
                  ),
                ),
        ));
  }

  _showQr() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey[800], width: 1)),
                    child: SfBarcodeGenerator(
                      value:  packageFunction.showPackageModel.data.qrcode,
                      symbology: QRCode(),
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
