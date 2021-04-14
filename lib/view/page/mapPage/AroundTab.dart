import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/page/mapPage/ListInMapPage.dart';
import 'package:sportapplication/view/page/mapPage/ListPage.dart';
import 'package:sportapplication/view/page/mapPage/MapConstant.dart';

class AroundTab extends StatelessWidget {

  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Expanded(
      child: Stack(
        children: [
          _pageView(),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:viewBellowButton(
                  title: controller.aroundActive.value == 0?"نقشه":"لیست",
                  icon: controller.aroundActive.value == 0? Icons.map:Icons.list_outlined,
                  onTap: (){
                    if(controller.aroundActive.value == 1){
                      controller.aroundActive(0);
                    }else{
                      controller.aroundActive(1);
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }

  _pageView() {
    if(controller.aroundActive.value == 1){
      return ListInMapPage();
    }else{
      return ListPage();
    }
  }

}

