import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/component/Constans.dart';

typedef void Onclick(String title , LatLng loc);
class SelectAddressPage extends StatefulWidget {

  Onclick onclick;
  SelectAddressPage({@required this.onclick});

  @override
  _SelectAddressPageState createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  String _address = "ابن سینا";
  static const LatLng _center = const LatLng(36.30, 59.58);
  LatLng _lastMapPosition = _center;

  TextEditingController _addressCont ;
  FocusNode _addressF;

  final sliderFunction = SliderFunction.to;

  @override
  void initState() {
    determinePosition().then((value) {
      currentLocation(latlong: LatLng(value.latitude,value.longitude), zoom: 15, dcontroller: _controller,);
    });
    _addressCont  = TextEditingController();
    _addressF = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _addressCont.dispose();
    _addressF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'انتخاب آدرس',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          body: Stack(
            children: [
              GoogleMap(
                  markers: _markers,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  onCameraMove: (position) {
                    _lastMapPosition = position.target;
                  },
                  onCameraIdle: () {
                    sliderFunction
                        .getAddress(
                            lat: _lastMapPosition.latitude.toString(),
                            lng: _lastMapPosition.longitude.toString())
                        .then((value) {
                      if (mounted) {
                        setState(() {
                          _address = value;
                        });
                      }
                    });
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition:
                      CameraPosition(target: LatLng(36.30, 59.58), zoom: 15)),
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 15, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      margin: EdgeInsets.only(top: 8),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _address,
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey[800]),
                              ),
                            ),
                          ),
                          IconButton(onPressed: () {
                            _addressCont.text = _address;
                              _changeAddress();
                          },
                          icon: Icon(Icons.edit,size: 20,),)
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              determinePosition().then((value) {
                                currentLocation(latlong: LatLng(value.latitude,value.longitude), zoom: 15, dcontroller: _controller,);
                              });
                            },
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.my_location_rounded,
                              size: 18,
                              color: Colors.grey[800],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            width: Get.width,
                            child: buttonWidget(
                                title: "تایید آدرس",
                                onPressed: () {
                                  widget.onclick(_address , _lastMapPosition);
                                  Get.back();
                                },
                                txtColor: Colors.white,
                                btnColor: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                  child: Icon(
                Icons.location_on,
                color: Colors.red,
                size: 50,
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _changeAddress() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Directionality(
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
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    formTextLabelWidget(
                       context: context,
                       controller: _addressCont,
                       focus: _addressF,
                       readeOnly: false,
                       label: "آدرس",
                       maxLine: 1,
                       minLine: 1,
                       keyboardType: TextInputType.text,
                       maxLength: 15000),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 6),
                      child:buttonWidget(title: "تایید", onPressed: (){
                        if(mounted){
                          setState(() {
                            _address = _addressCont.text;
                            Get.back();
                          });
                        }
                      }, btnColor: Colors.red, txtColor: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
