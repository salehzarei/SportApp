import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
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

  @override
  void initState() {
    _determinePosition().then((value) {
      print("asfsd");
      print("asfsd${value.longitude} + ${value.latitude}");
      _currentLocation(LatLng(value.latitude,value.longitude), 17.0);
    });

    registerFunction.getProductCategories(0);

    _markers.add(Marker(
      position: LatLng(36.3000493,59.5866227),
      markerId: MarkerId("1"),
     ));
    _markers.add(Marker(
      position: LatLng(36.299742, 59.589348),
      markerId: MarkerId("2"),
    ));
    _markers.add(Marker(
      position: LatLng(36.299984, 59.582911),
      markerId: MarkerId("3"),
    ));
    _markers.add(Marker(
      position: LatLng(36.301281, 59.580808),
      markerId: MarkerId("4"),
    ));
    _markers.add(Marker(
      position: LatLng(36.303551, 59.587170),
      markerId: MarkerId("5"),
    ));
    _markers.add(Marker(
      position: LatLng(36.310349, 59.580848),
      markerId: MarkerId("6"),
    ));
    _markers.add(Marker(
      position: LatLng(36.313166, 59.556338),
      markerId: MarkerId("7"),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
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
                itemCount: registerFunction.categoryLoading.value?0:registerFunction.categoryList.length,
                itemBuilder:(context, index) => categoryItemList(model: registerFunction.categoryList[index],onTab:(){
                    if(mounted){
                      setState(() {
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
                      print("Location");
                      _displayCurrentLocation().then((value) {
                        print("Location");
                        print("Location is : ${value.longitude} + ${value.latitude}");
                        _currentLocation(LatLng(value.latitude,value.longitude), 17.0);
                      });
                    },icon:Icon( Icons.my_location , size: 20 , color: Colors.black,)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void _currentLocation(LatLng latlong, zoom) async {
    print("sdfsdf  asdfsdf ${latlong.latitude}   asdfsdf ${latlong.longitude}");
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latlong, zoom: zoom),
      ),
    );
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

  Future<Position> _displayCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
