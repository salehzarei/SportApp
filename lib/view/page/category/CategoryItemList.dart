import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/Model/CategoryAccountTypeModel.dart';
import 'package:sportapplication/Model/providerModel.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/view/page/userInfo/DetailUserInfoPage.dart';

levelCategoryItem(
    {@required BuildContext context,
    @required int index,
    @required CategoryAccountTypeModel model,
    @required onTap,
    @required Controller controller}) {
  return Obx(
    () => GestureDetector(
      onTap:onTap,
      child: Container(
        // alignment: Alignment.center,
        // width: 100,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: controller.catActive.value == index
                ? Color(0xfafafafa)
                : Colors.grey[200],
            border: Border(
                right: BorderSide(
                    width: controller.catActive.value == index ? 2 : 0,
                    color: Theme.of(context).primaryColor),
                bottom: BorderSide(width: 1, color: Colors.grey[200]))),
        // padding: EdgeInsets.all(5),
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.ac_unit,
              size: 18,
              color: controller.catActive.value == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
             model.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                // fontFamily: 'sanse',
                // fontWeight: FontWeight.w700,
                fontSize: 13,
                color: Colors.grey[600],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

userItem(
    {@required BuildContext context,
    @required int index,
    @required ProviderPost data,
    @required Controller controller}) {
  return InkWell(
    onTap: () {
      Get.to(DetailUserInfoPage(data.id.toString()));
    },
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(data.pic),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(6)),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          data.title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            // fontFamily: 'sanse',
            // fontWeight: FontWeight.w700,
            fontSize: 13,
            color: Colors.grey[600],
          ),
        )
      ],
    ),
  );
}
