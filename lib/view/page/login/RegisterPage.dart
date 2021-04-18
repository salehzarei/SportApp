import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/view/component/Constans.dart';

class RegisterPage extends StatefulWidget {
  RegisterFunction place;
  RegisterPage({@required this.place});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final RegisterFunction place = Get.put(RegisterFunction());
  // TextEditingController _mobile = TextEditingController();
  // TextEditingController _mobile = TextEditingController();
  // TextEditingController _mobile = TextEditingController();
  // TextEditingController _mobile = TextEditingController();

  final Controller step = Get.put(Controller());
  Completer<GoogleMapController> controllerr = Completer();
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
    final GoogleMapController controller = await controllerr.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latlong, zoom: zoom),
      ),
    );
  }

  List<String> accountList = ['کاربر', 'باشگاه', 'مربی', 'دکتر', 'فروشگاه'];
  @override
  void initState() {
    widget.place.getPlaceData().then((v) {
      widget.place.ostanLoding.value = false;
      if (step.ostanSelected > 0) {
        widget.place.fetchCity(step.ostanSelected.value);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<RegisterFunction>(
        init: RegisterFunction(),
        builder: (val) => Scaffold(
          appBar: AppBar(
            title: Text(
              'ثبت نام',
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: step.activeStepOne.value == 0
                                    ? Colors.green
                                    : Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          step.activeSteptwo.value == 1 ? '✓' : '1',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: step.activeStepOne.value == 0
                                  ? Colors.green
                                  : Colors.black),
                        )),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 1,
                        color: step.activeSteptwo.value == 1
                            ? Colors.green
                            : Colors.grey,
                      )),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: step.activeSteptwo.value == 1
                                    ? Colors.green
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          step.activeStepthree.value == 1 ? '✓' : '2',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: step.activeSteptwo.value == 1
                                  ? Colors.green
                                  : Colors.grey),
                        )),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 1,
                        color: step.activeStepthree.value == 1
                            ? Colors.green
                            : Colors.grey,
                      )),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: step.activeStepthree.value == 1
                                    ? Colors.green
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          step.activeStepcomplete.value == 1 ? '✓' : '3',
                          //✓
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: step.activeStepthree.value == 1
                                  ? Colors.green
                                  : Colors.grey),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  step.stepPlus.value == 0
                      ? Expanded(
                          child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'تکمیل اطلاعات شخصی',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                textFieldLogin(
                                    context: context,
                                    controller: widget.place.name,
                                    labeltext: 'نام و نام خانوادگی',
                                    obscureText: false,
                                    textInputType: TextInputType.text,
                                    icons: null),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.dialog(Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        height: 300,
                                        width: 200,
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: Get.width,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Text(
                                                'نوع کاربری خود را انتخاب کنید',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                                child: ListView.builder(
                                                    itemCount:
                                                        accountList.length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Center(
                                                          child: InkWell(
                                                        onTap: () {
                                                          step.accountTypeTitle
                                                                  .value =
                                                              accountList[
                                                                  index];
                                                          step.accountTypeId
                                                                  .value =
                                                              index + 1;
                                                          Get.back();
                                                          print(step
                                                              .accountTypeId
                                                              .value);
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          alignment:
                                                              Alignment.center,
                                                          width: Get.width,
                                                          child: Text(
                                                            accountList[index],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ));
                                                    }))
                                          ],
                                        ),
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2,
                                            color: step.accountTypeId.value == 0
                                                ? Colors.grey
                                                : Theme.of(context)
                                                    .primaryColor)),
                                    // height: 45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          step.accountTypeTitle.value == ''
                                              ? 'انتخاب نوع کاربری'
                                              : 'نوع کاربری : ${step.accountTypeTitle.value}',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                textFieldLogin(
                                    context: context,
                                    controller: widget.place.mobile,
                                    labeltext: 'شماره همراه',
                                    obscureText: false,
                                    enabled: false,
                                    textInputType: TextInputType.number,
                                    icons: null),
                                SizedBox(
                                  height: 15,
                                ),
                                _buildOstanList(context, val),
                                SizedBox(
                                  height: 15,
                                ),
                                _buildCityList(context, val),
                                SizedBox(
                                  height: 15,
                                ),
                                textFieldLogin(
                                    context: context,
                                    controller: widget.place.pass,
                                    labeltext: 'رمز عبور',
                                    maxLength: 15,
                                    obscureText: true,
                                    textInputType: TextInputType.text,
                                    icons: null),
                                SizedBox(
                                  height: 15,
                                ),
                                textFieldLogin(
                                    context: context,
                                    controller: widget.place.repass,
                                    labeltext: 'تکرار رمز عبور',
                                    obscureText: true,
                                    maxLength: 15,
                                    enabled: true,
                                    textInputType: TextInputType.text,
                                    icons: null),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (widget.place.name.text.isEmpty) {
                                          errorSnackBar(
                                              text:
                                                  'نام و نام خانوادگی نمی تواند خالی باشد');
                                        } else if (step.accountTypeId.value ==
                                            0) {
                                          errorSnackBar(
                                              text:
                                                  'انتخاب نوع کاربری اجباری می باشد');
                                        } else if (step.ostanSelected.value ==
                                            0) {
                                          errorSnackBar(
                                              text:
                                                  'انتخاب استان اجباری می باشد');
                                        } else if (step.citySelected.value ==
                                            0) {
                                          errorSnackBar(
                                              text:
                                                  'انتخاب شهرستان اجباری می باشد');
                                        } else if (widget
                                                .place.pass.text.isEmpty ||
                                            widget.place.pass.text.length <=
                                                5) {
                                          errorSnackBar(
                                              text: 'رمز عبور را وارد کنید');
                                        } else if (widget
                                            .place.repass.text.isEmpty) {
                                          errorSnackBar(
                                              text:
                                                  'تکرار رمز عبور را وارد کنید');
                                        } else if (widget.place.pass.text !=
                                            widget.place.repass.text) {
                                          errorSnackBar(
                                              text: 'رمز عبور همخوانی ندارد');
                                        } else {
                                          step.name.value =
                                              widget.place.name.text;
                                          step.pass.value =
                                              widget.place.pass.text;
                                          step.activeSteptwo.value = 1;
                                          step.stepPlus.value = 1;
                                        }
                                      },
                                      child: Text(
                                        'مرحله بعد',
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColor)),
                                    ),
                                  ],
                                ),
                              ]),
                        ))
                      : step.stepPlus.value == 1
                          ? Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'آدرس خود را وارد کنید',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          // height: 400,
                                          child: GoogleMap(
                                            onMapCreated: (GoogleMapController
                                                controller) {
                                              controllerr.complete(controller);
                                            },
                                            initialCameraPosition:
                                                CameraPosition(
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
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                                  displayCurrentLocation()
                                                      .then((value) {
                                                    // _location = value;
                                                    currentLocation(
                                                        LatLng(value.latitude,
                                                            value.longitude),
                                                        15.0);
                                                  });
                                                },
                                                child: Container(
                                                  // width: Get.width,
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          print(_lastMapPosition.latitude);
                                          print(_lastMapPosition.longitude);
                                          step.lat.value = _lastMapPosition
                                              .latitude
                                              .toString();
                                          step.long.value = _lastMapPosition
                                              .longitude
                                              .toString();
                                          step.activeStepthree.value = 1;
                                          step.stepPlus.value = 2;
                                          if (step.accountTypeId.value == 1) {
                                            widget.place
                                                .getProductCategories(0);
                                          } else {
                                            // widget.place
                                            //     .getProductCategories(0);
                                            widget.place.getProductCategories(
                                                step.accountTypeId.value);
                                          }
                                        },
                                        child: Text(
                                          'مرحله بعد',
                                          textAlign: TextAlign.center,
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Theme.of(context)
                                                        .primaryColor)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : widget.place.categoryLoading.value == true
                              ? Expanded(
                                  child: Center(
                                  child: SpinKitDualRing(
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ))
                              : Expanded(
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'دسته بندی های حوزه فعالیت خود را انتخاب کید',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        ListView.builder(
                                            itemCount: widget
                                                .place.categoryList.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Row(
                                                children: [
                                                  CheckboxGroup(
                                                      labels: <String>[
                                                        widget
                                                            .place
                                                            .categoryList[index]
                                                            .title
                                                      ],
                                                      activeColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                      onSelected: (List<String>
                                                          checked) {
                                                        // List<dynamic> ids = step
                                                        //     .interest
                                                        //     .where((w) => w
                                                        //         .startsWith(widget
                                                        //             .place
                                                        //             .categoryList[
                                                        //                 index]
                                                        //             .id))
                                                        //     .toList();
                                                        // if (ids.length > 0) {
                                                        //   step.interest
                                                        //       .remove(ids[0]);
                                                        // } else {

                                                        // }
                                                        step.interest.add(widget
                                                            .place
                                                            .categoryList[index]
                                                            .id);
                                                        print(step.interest);
                                                        print(
                                                            checked.toString());
                                                      }),
                                                  // Checkbox(
                                                  //     value: true,
                                                  //     activeColor:
                                                  //         Colors.orangeAccent,
                                                  //     onChanged: (newValue) {}),
                                                  // Text(widget
                                                  //     .place
                                                  //     .categoryList[index]
                                                  //     .title)
                                                ],
                                              );
                                            }),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                step.activeStepcomplete.value =
                                                    1;
                                                step.stepPlus.value = 2;
                                              },
                                              child: Text(
                                                'تکمیل ثبت نام',
                                                textAlign: TextAlign.center,
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Theme.of(context)
                                                              .primaryColor)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOstanList(BuildContext context, RegisterFunction g) {
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
                  color: step.ostanSelected.value == 0
                      ? Colors.grey
                      : Theme.of(context).primaryColor)),
          child: FormField<String>(
            onSaved: (value) {
              step.ostanSelected.value = int.parse(value);
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
                              value: step.ostanSelected.value != null
                                  ? step.ostanSelected.value.toString()
                                  : '0',
                              dropdownColor: Colors.white,
                              onChanged: (String newValue) {
                                state.didChange(newValue);
                                step.ostanSelected.value = int.parse(newValue);
                                step.citySelected.value = 0;
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

  Widget _buildCityList(BuildContext context, RegisterFunction g2) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: step.citySelected.value == 0
                      ? Colors.grey
                      : Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(right: 10),
          // color: Theme.of(context).primaryColor,
          child: FormField<String>(
            onSaved: (value) {
              step.citySelected.value = int.parse(value);
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
                        step.citySelected.value = int.parse(id);
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
                              value: step.citySelected.value != null
                                  ? step.citySelected.value.toString()
                                  : '0',
                              dropdownColor: Colors.white,
                              onChanged: (String newValue) {
                                state.didChange(newValue);
                                step.citySelected.value = int.parse(newValue);
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
