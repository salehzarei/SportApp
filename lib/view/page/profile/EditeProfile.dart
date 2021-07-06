import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportapplication/controller/Functions/ProfileFunctions.dart';

import 'profileConstance.dart';

class EditeProfile extends StatefulWidget {
  @override
  _EditeProfileState createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  final pro = ProfileFunctions.to;

  Completer<GoogleMapController> controllerrs = Completer();
  static const LatLng _center = const LatLng(0, 0);

  LatLng _lastMapPosition = _center;
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Future<Position> displayCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  void currentLocation(LatLng latlong, zoom) async {
    final GoogleMapController controller = await controllerrs.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latlong, zoom: zoom),
      ),
    );
  }

  @override
  void initState() {
    pro.getPlaceData().then((v) {
      pro.ostanLoding.value = false;
      if (pro.ostanSelected > 0) {
        pro.fetchCity(pro.ostanSelected.value);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameEdite = TextEditingController();

    return SafeArea(
      child: GetBuilder<ProfileFunctions>(
        init: ProfileFunctions(),
        builder: (p) => Scaffold(
          appBar: AppBar(
            elevation: 2,
            brightness: Brightness.dark,
            title: Text("ویرایش پروفایل",
                style: TextStyle(fontSize: 18, color: Colors.white)),
            leading: IconButton(
                color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Get.back();
                }),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowGlow();
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  dividerEditeProfile(context, 'اطلاعات شخصی'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        textFieldEditeProfile(
                            context: context,
                            labeltext: 'نام و نام خانوادگی',
                            controllers: _nameEdite),
                        SizedBox(
                          height: 10,
                        ),
                        _buildOstanList(context, pro),
                        SizedBox(
                          height: 10,
                        ),
                        _buildCityList(context, pro),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  dividerEditeProfile(context, ' موقعیت مکانی'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 500,
                    child: Stack(
                      children: [
                        Container(
                          // height: 400,
                          child: GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              controllerrs.complete(controller);
                            },
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 15.0,
                            ),
                            mapType: MapType.normal,
                            // markers: _markers,
                            onCameraMove: _onCameraMove,
                            zoomControlsEnabled: false,
                            myLocationEnabled: false,
                            zoomGesturesEnabled: false,
                            myLocationButtonEnabled: false,
                          ),
                        ),
                        Container(
                          // height: 400,
                          child: Align(
                            child: Icon(
                              Icons.location_on,
                              size: 50,
                              color: Theme.of(context).primaryColor,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Container(
                          // height: 400,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: InkWell(
                                onTap: () {
                                  displayCurrentLocation().then((value) {
                                    // _location = value;
                                    currentLocation(
                                        LatLng(value.latitude, value.longitude),
                                        15.0);
                                  });
                                },
                                child: Container(
                                  // width: Get.width,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.location_searching,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              // child: IconButton(
                              //     icon: Icon(
                              //       Icons.location_searching,
                              //       size: 40,
                              //       color: Colors.red,
                              //     ),
                              //     onPressed: () {
                              //       submit.displayCurrentLocation()
                              //           .then((value) {
                              //         // _location = value;
                              //         submit.currentLocation(
                              //             LatLng(
                              //                 value.latitude,
                              //                 value
                              //                     .longitude),
                              //             15.0);
                              //       });
                              //     }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  dividerEditeProfile(context, 'لیست علاقه مندی ها'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOstanList(BuildContext context, ProfileFunctions g) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          // height: 80,
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2,
                  color: g.ostanSelected.value == 0
                      ? Colors.grey
                      : Theme.of(context).primaryColor)),
          child: FormField<String>(
            onSaved: (value) {
              g.ostanSelected.value = int.parse(value);
            },
            builder: (
              FormFieldState<String> state,
            ) {
              final List<DropdownMenuItem<String>> _ostanArr = [
                (DropdownMenuItem<String>(
                  value: '0',
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        'انتخاب استان',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ))
              ];
              if (!g.ostanLoding.value) {
                //   final List<DropdownMenuItem<String>> _subjectArr = [];
                if (g.ostanList.length > 0) {
                  g.ostanList.forEach((id, title) {
                    _ostanArr.add(DropdownMenuItem<String>(
                      value: id,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text(
                            'استان : $title',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ));
                  });
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  new InputDecorator(
                    decoration: const InputDecoration(
                      // fillColor: Colors.grey,
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.all(10),
                      // labelText: 'استان',
                      // labelStyle: TextStyle(color: Colors.black)
                    ),
                    child: g.ostanLoding.value
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                          )
                        : DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(
                                "انتخاب استان",
                                textAlign: TextAlign.right,
                              ),
                              value: g.ostanSelected.value != null
                                  ? g.ostanSelected.value.toString()
                                  : '0',
                              dropdownColor: Colors.white,
                              onChanged: (String newValue) {
                                state.didChange(newValue);
                                g.ostanSelected.value = int.parse(newValue);
                                g.citySelected.value = 0;
                                g.fetchCity(int.parse(newValue));
                              },
                              items: _ostanArr,
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCityList(BuildContext context, ProfileFunctions g2) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: g2.citySelected.value == 0
                      ? Colors.grey
                      : Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(right: 10),
          // color: Theme.of(context).primaryColor,
          child: FormField<String>(
            onSaved: (value) {
              g2.citySelected.value = int.parse(value);
            },
            builder: (
              FormFieldState<String> state,
            ) {
              final List<DropdownMenuItem<String>> _cityArr = [
                (DropdownMenuItem<String>(
                  value: '0',
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        'انتخاب شهرستان',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )),
              ];
              if (!g2.ostanLoding.value) {
                if (g2.cityList.length > 0) {
                  g2.cityList.forEach((id, title) {
                    _cityArr.add(DropdownMenuItem<String>(
                      value: id,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text(
                            'شهرستان : $title',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        g2.citySelected.value = int.parse(id);
                        // Get.back();
                      },
                    ));
                  });
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  new InputDecorator(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      // contentPadding: EdgeInsets.all(10),
                      // labelText: 'شهرستان',
                      // labelStyle: TextStyle(color: Colors.black)
                    ),
                    child: g2.cityLoding.value
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                          )
                        : DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("انتخاب شهرستان"),
                              value: g2.citySelected.value != null
                                  ? g2.citySelected.value.toString()
                                  : '0',
                              dropdownColor: Colors.white,
                              onChanged: (String newValue) {
                                state.didChange(newValue);
                                g2.citySelected.value = int.parse(newValue);
                              },
                              items: _cityArr,
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
