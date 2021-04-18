import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';

class NavigationBarWidget extends StatelessWidget {

  Controller controller;

  NavigationBarWidget({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            offset: Offset(0,6),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              _itemNavigation('assets/svg/home.svg','assets/svg/home-run.svg', 'خانه', 0, context),
              _itemNavigation('assets/svg/menuf.svg','assets/svg/menu.svg', 'دسته بندی', 1, context),
              _itemNavigation('assets/svg/boxf.svg','assets/svg/box.svg', 'خرید بسته', 2, context),
              _itemNavigation('assets/svg/locationf.svg','assets/svg/location.svg', 'اطراف من', 3, context),
              _itemNavigation('assets/svg/userf.svg','assets/svg/user.svg', 'پروفایل', 4, context),
            ],
          ),
        ],
      ),
    );
  }

  _itemNavigation(String imagef,String image , String title , int index,BuildContext context){
    return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            if (controller.activclick.value != index) {
              controller.activclick(index);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                // controller.activclick.value == index? imagef: image,
                controller.activclick.value == index? imagef: image,
                width: 18,
                height: 18,
                color: controller.activclick.value == index
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
              SizedBox(height: 8,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: controller.activclick.value == index? FontWeight.w400:FontWeight.w200,
                  color: controller.activclick.value == index
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                ),
              )
            ],
          ),
        ));
  }

}
