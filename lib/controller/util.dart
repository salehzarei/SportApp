import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportapplication/Model/PlanModel.dart';
import 'package:sportapplication/view/component/Constans.dart';
import 'package:url_launcher/url_launcher.dart';

maskedText(String price) {
  return MoneyMaskedTextController(
          precision: 0,
          thousandSeparator: ',',
          decimalSeparator: '',
          initialValue: double.parse(price))
      .text;
}

snackBar(String message, color) {
  return SnackBar(
      backgroundColor: color,
      content: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'sanse',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ));
}

Future saveShared(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getShared(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final _loadShared = prefs.getString(key);
  return _loadShared;
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'امکان باز کردن این سایت وجود ندارد:  $url';
  }
}

listSnackBar({@required list, @required bool err}) {
  return Get.snackbar(
    '',
    '',
    titleText: Text(''),
    messageText: Container(
      child: ListView.builder(
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: HtmlWidget(
                list[index],
                textStyle:
                    TextStyle(color: Colors.white, height: 1.2, fontSize: 14),
              ),
            );
          }),
    ),
    backgroundColor: err ? Colors.red : Colors.green,
    colorText: Colors.white,
    icon: Icon(
      err ? Icons.error : Icons.check,
      color: Colors.white,
      size: 40,
    ),
  );
}

showBtn({
  @required BuildContext context ,
  @required PlanData planList,
  @required TextEditingController controller ,
  @required FocusNode focusNode,
  @required checkCouponClick,
  @required int discountPrice,
  @required showBtnState,
  @required payClick} ) {
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
                                '${maskedText(( planList.price - planList.off).toString())} تومان ',
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
                                focus: focusNode,
                                controller: controller,
                                hint: "کد تخفیف",
                                maxLine: 1,
                                minLine: 1,
                                keyboardType: TextInputType.text,
                                maxLength: 1000),
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: checkCouponClick,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "قیمت نهایی:",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            '${maskedText((planList.price - planList.off - discountPrice).toString())} تومان ',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
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
                            onPressed: payClick,
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


Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
}


Future<String> getVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;

}


Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print("Location services are disabled.");
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    print("Location permissions are denied.0");
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print("Location permissions are denied.");
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print("'Location permissions are permanently denied, we cannot request permissions.");
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  print("Location services are OK.");
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

Future<Position> displayCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

void currentLocation({@required LatLng latlong, @required zoom, @required dcontroller }) async {
  final GoogleMapController controller = await dcontroller.future;
  controller.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(target: latlong, zoom: zoom),
    ),
  );
}
