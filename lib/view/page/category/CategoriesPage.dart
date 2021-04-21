import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/view/page/category/CategoryList.dart';

class CategoriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          _itemCat(context,'assets/svg/coach.svg', 'مربیان',3),
          _itemCat(context,'assets/svg/doctor.svg', 'پزشکان',4),
          _itemCat(context,'assets/svg/gym.svg', 'باشگاه ها',2),
          _itemCat(context,'assets/svg/shop.svg', 'فروشگاه ها',5),
        ],
      ),
    );
  }

  _itemCat(BuildContext context,String image,String title,int index){
    return InkWell(
      onTap: () {
        Get.to(CategoryList(from: 1 , level:index, title: title,));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:Theme.of(context).primaryColorDark
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        image,
                        width: 25,
                        height: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(child: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200,color: Colors.black),))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 1,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }

}
