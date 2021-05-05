import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/util.dart';
import 'package:sportapplication/view/page/map/MapConstant.dart';

class ListInMapPage extends StatefulWidget {
  @override
  _ListInMapPageState createState() => _ListInMapPageState();
}

class _ListInMapPageState extends State<ListInMapPage> {

  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  final RegisterFunction registerFunction = Get.put(RegisterFunction());
  int indexItem = 0;
  List<String> accountList = [ 'باشگاه', 'مربی', 'دکتر', 'فروشگاه'];
  String _token;
  bool showUser = false;

  @override
  void initState() {
    getShared("token").then((token){
      _token = token;
      getProvider("2");
    });
    _determinePosition().then((value) {
      currentLocation(LatLng(value.latitude,value.longitude), 17.0);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            GoogleMap(
                markers: _markers,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onCameraMove: (position) {},
                onCameraIdle: () {},
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: CameraPosition(
                    target:  LatLng(36.30, 59.58),
                    zoom: 15)),
            Container(
              height: 45,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 3),
              margin: EdgeInsets.symmetric(vertical: 6),
              child: ListView.builder(
                padding: EdgeInsets.only(right: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: accountList.length,
                itemBuilder:(context, index) => categoryItemList1(title:accountList[index],onTab:(){
                    if(mounted){
                      setState(() {
                        showUser = false;
                        switch(index){
                          case 0:

                            getProvider("2");
                            break;
                          case 1:
                            getProvider("3");
                            break;
                              case 2:
                                getProvider("4");
                            break;
                          case 3:
                            getProvider("5");
                            break;

                        }
                        indexItem = index;
                      });
                    }
                }, index: index , indexItem:indexItem, context: context),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(bottom: 25 , right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[400] , width: 1)
                  ),
                  child: Center(
                    child: IconButton(onPressed: () {
                      displayCurrentLocation()
                          .then((value) {
                        // _location = value;
                        currentLocation(
                            LatLng(value.latitude,
                                value.longitude),
                            15.0);
                      });
                    },icon:Icon( Icons.my_location , size: 20 , color: Colors.black,)),
                  ),
                ),
              ),
            ),
            showUser? Padding(
              padding: EdgeInsets.only(left: 6 , right: 6 , bottom: 60),
              child: Align(child: itemSubsetUserList(context: context, data: registerFunction.showProviderModel, onPressed: (){
                if(mounted){
                  setState(() {
                    showUser = false;
                  });
                }
              }),alignment: Alignment.bottomCenter,),
            ):Container()
          ],
        ),
      ),
    );
  }

  getProvider(String level)async{
    final Uint8List markerIcod = await getBytesFromAsset('assets/image/icon.png', 120);
    registerFunction.providers( token: _token, following: '', level: level, activity_scope: '', special: '',).whenComplete(() {
      if(!registerFunction.providerLoading.value){
        _markers.clear();
        registerFunction.providerList.post.forEach((element) {
          _markers.add(Marker(
            icon:BitmapDescriptor.fromBytes(markerIcod) ,
            position: LatLng(double.parse(element.lat),double.parse(element.lng)),
            markerId: MarkerId(element.id.toString()),
            onTap: () {
              registerFunction.showProvider(token: _token, bId: element.id.toString()).whenComplete(() {
                if(!registerFunction.showProviderLoading.value){
                  if(mounted){
                    setState(() {
                      showUser = true;
                    });
                  }
                }
              });
            },
          ));
        });
        if(mounted){
          setState(() {
            print('_markers');
            print(_markers.length);
          });
        }
      }
    });
  }

  Future<Position> _determinePosition() async {
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

  void currentLocation(LatLng latlong, zoom) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latlong, zoom: zoom),
      ),
    );
  }

}
